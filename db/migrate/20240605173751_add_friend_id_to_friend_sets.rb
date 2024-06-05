class AddFriendIdToFriendSets < ActiveRecord::Migration[7.0]
  def change
    add_reference :friend_sets, :friend, null: false, foreign_key: true
  end
end
