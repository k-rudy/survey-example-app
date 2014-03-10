class Survey < ActiveRecord::Base
  
  belongs_to :user
  
  validates :email, uniqueness: true, presence: true
  
  def by_token(token)
    #TODO: add implementation
  end
end
