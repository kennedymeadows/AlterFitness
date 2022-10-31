class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gfcs
  enum role: [:user, :moderator, :admin]
  after_initialize :default_role, if: :new_record?

  private 
  
  def default_role
    self.role ||= :user
  end
end
