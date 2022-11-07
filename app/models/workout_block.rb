class WorkoutBlock < ApplicationRecord
  belongs_to :gfc
  validates_associated :gfc
  has_rich_text :body

  def body
    rich_text_body || build_rich_text_body(body: read_attribute(:body))
  end
end
