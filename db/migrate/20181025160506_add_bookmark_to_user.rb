class AddBookmarkToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookmarks, :user, foreign_key: true
  end
end
