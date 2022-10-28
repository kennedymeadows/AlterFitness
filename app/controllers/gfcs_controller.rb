class GfcsController < ApplicationController
  before_action :set_gfc, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]

  # GET /gfcs or /gfcs.json
  def index
    @gfcs = Gfc.all.order(created_at: :desc)
  end

  # GET /gfcs/1 or /gfcs/1.json
  def show
  end

  # GET /gfcs/new
  def new
    @gfc = Gfc.new
  end

  # GET /gfcs/1/edit
  def edit
  end

  # POST /gfcs or /gfcs.json
  def create
    @gfc = Gfc.new(gfc_params)
    @gfc.user = current_user

    respond_to do |format|
      if @gfc.save
        format.html { redirect_to gfc_url(@gfc), notice: "Group Fitness Class was successfully created." }
        format.json { render :show, status: :created, location: @gfc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gfc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gfcs/1 or /gfcs/1.json
  def update
    respond_to do |format|
      if @gfc.update(gfc_params)
        format.html { redirect_to gfc_url(@gfc), notice: "Group Fitness Class was successfully updated." }
        format.json { render :show, status: :ok, location: @gfc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gfc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gfcs/1 or /gfcs/1.json
  def destroy
    @gfc.destroy

    respond_to do |format|
      format.html { redirect_to gfcs_url, notice: "Gfc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gfc
      @gfc = Gfc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gfc_params
      params.require(:gfc).permit(:title, :body, :name)
    end
end