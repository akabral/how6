json.extract! pedido, :id, :name, :name, :date, :date_validade, :status, :deleted_at, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
 
json.itempedidos pedido.itempedidos do |attachment|
  json.id attachment.id
  json.produto attachment.produto.name
  json.idproduto attachment.produto_id
  json.valor attachment.valor
end
