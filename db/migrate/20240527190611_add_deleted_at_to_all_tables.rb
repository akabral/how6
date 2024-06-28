class AddDeletedAtToAllTables < ActiveRecord::Migration[7.1]
  def change
    tables = ActiveRecord::Base.connection.tables

    tables.each do |table|
      unless column_exists?(table, :deleted_at)
        add_column table, :deleted_at, :datetime
        add_index table, :deleted_at
      end
    end
  end
end
