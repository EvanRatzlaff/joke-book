class Room < ApplicationRecord
    validates :name, presence: true
    validates :location, uniqueness: true
    validates :description, presence: true
    
    has_many :jokes
    has_many :users, through: :jokes
    
    accepts_nested_attributes_for :users

    scope :search, -> (query, user) {query ? user.rooms.where("title like ?", "%#{query}%") : user.rooms }

end
