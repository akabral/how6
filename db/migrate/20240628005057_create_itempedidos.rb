class CreateItempedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :itempedidos do |t|
      t.decimal :valor, precision: 9, scale: 3
      t.datetime :deleted_at
      t.references :produto, null: false, foreign_key: true
      t.references :pedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end
