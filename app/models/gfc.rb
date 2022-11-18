class Gfc < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 50 }
    belongs_to :user
    belongs_to :class_type
    has_many :workout_blocks, dependent: :destroy
    
    after_commit :build_workout_blocks_loop, on: :create
    private
    def build_workout_blocks_loop
        i = 0
        block_count = self.class_type.block_count
        while (i < block_count)
            self.workout_blocks.create!(user: self.user, body: "Fill in the details of your class within these workout blocks!")
            i += 1
        end
    end
end
