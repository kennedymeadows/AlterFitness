class Gfc < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 50 }
    belongs_to :user
    has_many :workout_blocks, dependent: :destroy
    validates_length_of :workout_blocks, maximum: 4
    belongs_to :class_type
end
