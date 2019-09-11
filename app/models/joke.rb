class Joke < ApplicationRecord
    validates :title, presence: true  
    validates :content, presence: true, length: {minimum: 10 }
    
    belongs_to :user
    belongs_to :rooms, optional: true
    has_many :comments, through: :users
    accepts_nested_attributes_for 
end
