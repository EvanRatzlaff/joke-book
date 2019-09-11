class Room < ApplicationRecord
    validates :name, presence: true
    validates :location, uniqueness: true
    
    has_many :jokes
    has_many :users, through: :jokes
    has_many :comments, through: :users
end
