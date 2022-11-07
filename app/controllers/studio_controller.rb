class StudioController < ApplicationController
    def show
        @studio = Gfc.where(["studio = ?", :true]).first
    end
end
