class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :email
      t.string :last_name
      t.string :first_name
      t.string :document_number
      t.integer :docket_number
      t.belongs_to :grade
      t.index [:docket_number, :grade_id], :unique => true

      t.timestamps
    end
  end
end
