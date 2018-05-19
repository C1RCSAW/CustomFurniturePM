class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table :costs do |t|
      t.string :description
      t.float :amount
      t.integer :project_id
    end
  end
end
