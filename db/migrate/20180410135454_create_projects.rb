class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :furniture_type #ex chair, table, bench, facia, etc.
      t.string :material
      t.string :description
      t.float :cost_to_produce
      t.float :price_to_client
      t.string :status
      t.integer :client_id
    end
  end
end
