class GfcsController < ApplicationController
  before_action :set_gfc, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /gfcs or /gfcs.json
  def index
    @gfcs = Gfc.all.order(updated_at: :desc)
  end

  def my_classes
    @gfcs = Gfc.where(user: current_user).order(updated_at: :desc)
  end
  
  # GET /gfcs/1 or /gfcs/1.json
  def show
    @workout_blocks = @gfc.workout_blocks.order(created_at: :asc)
  end

  # GET /gfcs/new
  def new
    @gfc = Gfc.new
  end

  # GET /gfcs/1/edit
  def edit
  end

  def remove_display
  end

  def send_to_display
    @gfc = Gfc.find(params[:id])
    @old_display = Gfc.where(studio: true)
    @old_display.update_all(studio: false)
    @gfc.update_attribute(:studio, true)
    redirect_to gfc_url(@gfc), notice: "This class has been sent to the display."
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
    @gfc.workout_blocks.destroy_all
    @gfc.destroy

    respond_to do |format|
      format.html { redirect_to gfcs_url, notice: "Group fitness class was successfully destroyed." }
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
      params.require(:gfc).permit(:title, :name, :studio, :class_type_id)
    end
end
