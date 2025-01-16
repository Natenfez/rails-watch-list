class AddUniqueIndexToListsName < ActiveRecord::Migration[7.1]
  def change
    add_index :lists, :name, unique: true
  end
end
