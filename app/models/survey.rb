class Survey < ActiveRecord::Base
  
  belongs_to :user
  
  validates :email, uniqueness: true, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validates :rating, presence: { on: :update }
  validates :comment, presence: { on: :update }
  
  def by_token(token)
    #TODO: add implementation
  end
end
