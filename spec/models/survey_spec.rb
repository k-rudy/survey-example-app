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
  
  describe 'scopes' do
    
    subject { Survey }
    
    describe '#pending' do
      
      let!(:new_survey) { create(:survey) }
      let!(:answered_survey) { create(:survey, responded_at: 1.day.ago) }
      
      it 'returns only surveys with responded_at=nil' do
        expect(subject.pending).to eq([ new_survey ])
      end
    end
  end
end
