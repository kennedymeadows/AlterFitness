class WorkoutBlocksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_gfc

    def create
        @workout_block = @gfc.workout_blocks.create(workout_block_params)
        @workout_block.user = current_user

        if @workout_block.save
            flash[:notice] = "Workout block has been created"
            redirect_to gfc_path(@gfc)
        else
            flash[:alert] = "Workout block has not been created"
            redirect_to gfc_path(@gfc)
        end
    end

    def destroy
        @workout_block = @gfc.workout_blocks.find(params[:id])
        @workout_block.destroy
        redirect_to gfc_path(@gfc)
    end

    def update
        @workout_block = @gfc.workout_blocks.find(params[:id])
        
        respond_to do |format|
            if @workout_block.update(workout_block_params)
                format.html { redirect_to gfc_url(@gfc), notice: 'Workout block has been updated' }
            else
                format.html { redirect_to gfc_url(@gfc), notice: 'Workout block update failed. Note: The title has a maximum length of 15 characters' }
            end
        end
    end

    private

    def set_gfc
        @gfc = Gfc.find(params[:gfc_id])
    end

    def workout_block_params
        params.require(:workout_block).permit(:body, :name)
    end

end
