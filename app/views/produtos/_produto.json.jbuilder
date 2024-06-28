json.extract! produto, :id, :name, :valor, :deleted_at, :created_at, :updated_at
json.url produto_url(produto, format: :json)
