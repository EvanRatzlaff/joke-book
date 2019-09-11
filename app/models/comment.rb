class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :room, optional: true
    belongs_to :joke, optional: true
    
    accepts_nested_attributes_for :user
    #validate nil for room_id and joke_id "custom validator" && statement
end
