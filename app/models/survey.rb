class Survey < ActiveRecord::Base
  
  belongs_to :user
  
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validates :rating, presence: { on: :update }
  validates :comment, presence: { on: :update }
  
  scope :pending, ->{ where(responded_at: nil) }
  
  default_scope ->{ order('updated_at desc') }
  
  def by_token(token)
    #TODO: add implementation
  end
end
