class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.decimal :score, :precision => 4, :scale => 2
      t.belongs_to :student, index: true
      t.belongs_to :exam_instance, index: true
      
      t.timestamps      
    end
  end
end

