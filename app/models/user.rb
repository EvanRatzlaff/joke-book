class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true
    validates :username, uniqueness: true
    validates :password, presence: true, on: :create
    has_secure_password

    
     has_many :jokes
     has_many :rooms, through: :jokes
     has_many :likes, dependent: :destroy

     def self.find_or_create_by_omniauth(auth)
       user = User.find_by(email: auth['info']['email'])

       if user.nil?
        user = User.create(email: auth['info']['email'], username: auth['info']['email'], password: SecureRandom.hex, uid: auth['uid'])
        elsif user.uid.nil?
            user.update(uid:auth['uid'])
        end 
        user
     end
    
end
