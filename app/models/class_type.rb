class ClassType < ApplicationRecord
    has_many :gfcs
    belongs_to :video
end
