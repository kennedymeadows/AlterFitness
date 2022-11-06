class StudioController < ApplicationController
    # def studio
    #     render template: 'layouts/alterstudio'
    # end
    def show
        @studio = Gfc.where(["studio = ?", :true]).first
    end

end
