class Like < ApplicationRecord
  belongs_to :joke
  belongs_to :user

  def self.liked?
    @user = User.find_by_id(:user_id)
    @joke = Joke.find_by_id(:joke_id)
    Like.where(user_id: @user, joke_id: @joke).exists?
  end
end
