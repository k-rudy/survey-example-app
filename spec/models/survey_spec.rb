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
  
  describe '#by_token' do
    
    subject { Survey }
    
    context 'when the survey is pending' do
      
      let!(:survey) { create(:survey, token: 'token') }
      let!(:survey_2) { create(:survey, token: '123') }
      
      it 'queries survey by token' do
        expect(subject.by_token('token')).to eq(survey)
      end
    end
    
    context 'when the survey is not pending' do
      
      let!(:survey) { create(:survey, token: 'token', responded_at: 2.hours.ago) }
      
      it 'returns nil' do
        expect(subject.by_token('token')).to be_nil
      end
    end
  end
  
  describe '#search' do
    
    subject { Survey }
    
    let!(:user) { create(:user) }
    let!(:survey1) { create(:survey, email: 'test@user.com', user: user) }
    let!(:survey2) { create(:survey, comment: 'ruby is a great language', user: user) } 
    
    it 'searches in email field' do
      expect(subject.search('test@user.com', user.id)).to eq([ survey1 ])
    end
    
    it 'searches in comment field' do
      expect(subject.search('language', user.id)).to eq([ survey2 ])
    end
    
    it 'searches only withing surveys of the user' do
      expect(subject.search('language', 10)).to be_empty
    end
  end
end
