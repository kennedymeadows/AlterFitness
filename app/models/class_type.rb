class ClassType < ApplicationRecord
    has_many :gfcs
    belongs_to :video
    def name_with_video
        "#{title} - #{video.name} Background"
    end
end
