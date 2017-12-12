class AddIndexToGrades < ActiveRecord::Migration[5.1]
  def change
    add_index :grades, :year, unique: true
  end
end
