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

    private

    def set_gfc
        @gfc = Gfc.find(params[:gfc_id])
    end

    def workout_block_params
        params.require(:workout_block).permit(:body)
    end

end
