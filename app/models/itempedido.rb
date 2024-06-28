class Itempedido < ApplicationRecord

  PERMIT_PARAMS = [:valor, :deleted_at, :produto_id, :pedido_id, :id, :_destroy]


  belongs_to :produto
  belongs_to :pedido

  private

  def self.permit_params
    params = PERMIT_PARAMS
    params
  end

end
