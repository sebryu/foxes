class FoxesController < ApplicationController
  before_action :set_fox, only: [:show, :edit, :update, :destroy, :adopt]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  # GET /foxes
  # GET /foxes.json
  def index
    @foxes = Fox.order("age")
  end

  def unadopted
    @foxes = Fox.where(user: nil)
    # hash = {imie: 'seb', nazwisko: 'esz'}
    #
    # hash[:imie] -> seb

  end

  # GET /foxes/1
  # GET /foxes/1.json
  def show
  end

  # GET /foxes/new
  def new
    @fox = Fox.new
  end

  # GET /foxes/1/edit
  def edit
  end

  # POST /foxes
  # POST /foxes.json
  def create
    @fox = Fox.new(fox_params)
    @fox.user = current_user

    respond_to do |format|
      if @fox.save
        format.html { redirect_to @fox, notice: 'Fox was successfully created.' }
        format.json { render :show, status: :created, location: @fox }
      else
        format.html { render :new }
        format.json { render json: @fox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foxes/1
  # PATCH/PUT /foxes/1.json
  def update
    respond_to do |format|
      if @fox.update(fox_params)
        format.html { redirect_to @fox, notice: 'Fox was successfully updated.' }
        format.json { render :show, status: :ok, location: @fox }
      else
        format.html { render :edit }
        format.json { render json: @fox.errors, status: :unprocessable_entity }
      end
    end
  end

  def adopt
    if @fox.user
      redirect_to foxes_path, notice: 'Ten lisek już ma właściciela'
    else
      @fox.adopt(current_user)
      redirect_to @fox, notice: 'Przygarnąłeś liska'
    end
  end

  # DELETE /foxes/1
  # DELETE /foxes/1.json
  def destroy
    @fox.unadopted
    respond_to do |format|
      format.html { redirect_to foxes_url, notice: 'Fox was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fox
      @fox = Fox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fox_params
      params.require(:fox).permit(:name, :age, :color, :tail)
    end
end
