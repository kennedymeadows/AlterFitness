class Gfc < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 50 }
    validates :body, presence: true, length: { minimum: 10, maximum: 2000 }
    belongs_to :user
    has_rich_text :body

    def body
        rich_text_body || build_rich_text_body(body: read_attribute(:body))
    end
end
