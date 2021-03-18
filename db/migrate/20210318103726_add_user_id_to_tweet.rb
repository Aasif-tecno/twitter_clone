class AddUserIdToTweet < ActiveRecord::Migration[6.1]
  def change
    add_reference :tweeets, :user, foreign_key: true
  end
end
