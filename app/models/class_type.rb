class ClassType < ApplicationRecord
    has_many :gfcs, dependent: :destroy
    belongs_to :video
    def name_with_video
        "#{title} - #{video.name} Background"
    end
end
