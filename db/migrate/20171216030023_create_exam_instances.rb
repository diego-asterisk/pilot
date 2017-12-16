class CreateExamInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_instances do |t|
      t.string :title
      t.datetime :exam_date
      t.decimal :min_score, :precision => 4, :scale => 2
      t.belongs_to :grade

      t.timestamps
    end
  end
end
