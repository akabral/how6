class ItempedidosController < AdminController
  before_action :set_itempedido, only: %i[ show edit update destroy ]

  # GET /itempedidos or /itempedidos.json
  def index
    @itempedidos = Itempedido.all
  end

  # GET /itempedidos/1 or /itempedidos/1.json
  def show
  end

  # GET /itempedidos/new
  def new
    @itempedido = Itempedido.new
  end

  # GET /itempedidos/1/edit
  def edit
  end

  # POST /itempedidos or /itempedidos.json
  def create
    @itempedido = Itempedido.new(itempedido_params)

    respond_to do |format|
      if @itempedido.save
        format.html { redirect_to itempedido_url(@itempedido), notice: "Itempedido was successfully created." }
        format.json { render :show, status: :created, location: @itempedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @itempedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itempedidos/1 or /itempedidos/1.json
  def update
    respond_to do |format|
      if @itempedido.update(itempedido_params)
        format.html { redirect_to itempedido_url(@itempedido), notice: "Itempedido was successfully updated." }
        format.json { render :show, status: :ok, location: @itempedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @itempedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itempedidos/1 or /itempedidos/1.json
  def destroy
    @itempedido.destroy!

    respond_to do |format|
      format.html { redirect_to itempedidos_url, notice: "Itempedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itempedido
      @itempedido = Itempedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def itempedido_params
      params.require(:itempedido).permit(:valor, :deleted_at, :produto_id, :pedido_id)
    end
end
