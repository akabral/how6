class EnablePostgisExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension "postgis"
  end
end

#rails db:migrate:up VERSION=20240522145900