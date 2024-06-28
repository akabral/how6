class CreateProdutos < ActiveRecord::Migration[7.1]
  def change
    create_table :produtos do |t|
      t.string :name
      t.decimal :valor, precision: 9, scale: 3
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
