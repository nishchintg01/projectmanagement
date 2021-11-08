class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :duration
      t.string :status
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
