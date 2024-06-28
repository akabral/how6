class Pedido < ApplicationRecord
    PERMIT_PARAMS = [:name, :name, :date, :date_validade, :status, :deleted_at]
    STATUS = [:Cotacao, :Aprovado, :Cancelado]

    has_many :itempedidos, class_name: "Itempedido", dependent: :destroy, validate: :validates_associated
        
    accepts_nested_attributes_for :itempedidos, allow_destroy: true    




    private

    def self.permit_params
        params = PERMIT_PARAMS
        params += [itempedidos_attributes: Itempedido.permit_params]
        params
    end
  
end
