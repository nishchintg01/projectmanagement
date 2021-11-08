class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.integer :phone
      t.string :emp_id
      t.string :designation

      t.timestamps
    end
  end
end
