require 'spec_helper'

describe Survey do
  
  describe 'validation' do
    it { should validate_presence_of :email }
    it { should_not allow_value("test@test").for(:email) }
    it { should allow_value("test@test.com").for(:email) }
    it { should allow_value(nil).for(:rating).on(:create) }
    it { should_not allow_value(nil).for(:rating).on(:update) }
    it { should allow_value(nil).for(:comment).on(:create) }
    it { should_not allow_value(nil).for(:comment).on(:update) }
  end
end
