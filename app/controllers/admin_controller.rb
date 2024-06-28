class AdminController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :set_menu_items

    def index

    end

    private

    def set_menu_items
        @menu_items = {
            "Home": {"Overview": pedidos_path},
            "Pedidos": pedidos_path,
            "Produtos": produtos_path,
            "Itens Pedidos": itempedidos_path,
            "Perfil": edit_user_registration_path, 
            "Sair": destroy_user_session_path, 
            }
    
        @expanded = "Home"
    end
end
