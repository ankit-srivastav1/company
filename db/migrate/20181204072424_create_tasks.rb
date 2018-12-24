class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :tname
      t.string :assigned_by
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
