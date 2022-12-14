class WorkoutBlock < ApplicationRecord
  belongs_to :gfc
  belongs_to :user
  validates_associated :gfc
  has_rich_text :body
  validates :name, length: { maximum: 20 }


  def body
    rich_text_body || build_rich_text_body(body: read_attribute(:body))
  end
end
