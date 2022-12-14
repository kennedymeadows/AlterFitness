class StudioController < ApplicationController
    layout 'studio', only: [:studio]
    def show
        @studio = Gfc.where(["studio = ?", :true]).first
    end
end
