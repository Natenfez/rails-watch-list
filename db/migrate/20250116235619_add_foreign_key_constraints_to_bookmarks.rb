class AddForeignKeyConstraintsToBookmarks < ActiveRecord::Migration[7.1]
  def change
    unless foreign_key_exists?(:bookmarks, :movies)
      add_foreign_key :bookmarks, :movies, on_delete: :restrict
    end

    # Check and add foreign key for lists
    unless foreign_key_exists?(:bookmarks, :lists)
      add_foreign_key :bookmarks, :lists, on_delete: :cascade
    end
  end
end
