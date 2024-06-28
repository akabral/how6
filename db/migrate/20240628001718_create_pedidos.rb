class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.string :name
      t.date :date
      t.date :date_validade
      t.integer :status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

