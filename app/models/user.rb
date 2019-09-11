class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true
    validates :username, uniqueness: true
    validates :password, presence: true, on: :create
    has_secure_password

     has_many :comments
     has_many :jokes
     has_many :rooms, through: :jokes

     def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.name = auth.info.name
            user.email = auth.info.email
        end
     end

end
