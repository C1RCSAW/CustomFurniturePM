class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :furniture_type #ex chair, table, bench, facia, etc.
      t.string :material
      t.string :cost_to_produce
      t.string :price_to_client
      t.string :status
      t.integer :user_id
  end
end
