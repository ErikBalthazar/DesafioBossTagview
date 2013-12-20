class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
	@responsibles = Responsible.all
	if params[:responsibles] != "" && params[:responsibles] != nil
		@responsible = Responsible.find(params[:responsibles])
	end			
  end
  
  def list
	@bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
	@responsibles = Responsible.all
  end

  # GET /bills/1/edit
  def edit
	@responsibles = Responsible.all
  end

  # POST /bills
  # POST /bills.json
  def create
	@responsible = Responsible.find(params[:bill][:responsible])
	@responsible.bills.create(params[:bill].permit(:date, :description, :value))
	@bill = Bill.new(bill_params)
	
	respond_to do |format|
		format.html { redirect_to @bill, notice: 'Despesa criada com sucesso' }
		format.json { render action: 'show', status: :created, location: @bill }			
	end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Despesa editada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:date, :description, :value, :responsible_id)
    end
end
