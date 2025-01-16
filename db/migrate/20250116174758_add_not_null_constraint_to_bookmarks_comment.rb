class AddNotNullConstraintToBookmarksComment < ActiveRecord::Migration[7.1]
  def change
    change_column_null :bookmarks, :comment, false
  end
end
