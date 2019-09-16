class Joke < ApplicationRecord
    validates :title, presence: true , length: { minimum: 5 } 
    validates :content, presence: true, length: {minimum: 10 }
    
    belongs_to :user
    belongs_to :room
    has_many :likes, dependent: :destroy
  
    #accepts_nested_attributes_for :rooms
    # accepts_nested_attributes_for :users

    scope :search, -> (query, user) { query ? user.jokes.where("title LIKE ?", "%#{query}%") : user.jokes }
end
