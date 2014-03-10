class Survey < ActiveRecord::Base
  
  belongs_to :user
  
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validates :rating, presence: true, on: :update
  validates :comment, presence: true, on: :update
  
  scope :pending, ->{ where(responded_at: nil) }
  
  default_scope ->{ order('updated_at desc') }
  
  class << self
    # Retrieves survey by token. Queries only pending surveys
    #
    # @return [ Survey ] survey found
    def by_token(token)
      Survey.pending.where(token: token).first
    end
  end
end
