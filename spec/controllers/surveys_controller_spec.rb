require 'spec_helper'

describe SurveysController do
  
  it_behaves_like 'user-only for', [ :index, { create: :post } ]

  describe 'GET index' do
    
    let!(:user) { create(:user) }
    let!(:survey) { create(:survey, user: user) }
    
    before { login_user(user) }
    
    it 'assigns all surveys as @surveys' do
      get :index
      expect(assigns(:surveys)).to eq([ survey ])
    end
    
    it 'assigns a new survey as @survey' do
      get :index
      expect(assigns(:survey)).to be_a_new(Survey)
    end
  end

  describe 'POST create' do
    
    let!(:user) { create(:user) }
    
    before do
      ActionMailer::Base.deliveries = []
      login_user(user)
    end
    
    describe 'with valid params' do
      
      it 'creates a new Survey' do
        expect {
          post :create, survey: { email: 'test@mail.com' }
        }.to change(Survey, :count).by(1)
      end

      it 'assigns a newly created survey as @survey' do
        post :create, survey: { email: 'test@mail.com' }
        expect(assigns(:survey)).to be_a(Survey)
        expect(assigns(:survey)).to be_persisted
      end

      it 'redirects to the surveys list' do
        post :create, survey: { email: 'test@mail.com' }
        expect(response).to redirect_to(:surveys)
      end
      
      it 'sends an email to the user' do
        post :create, survey: { email: 'test@mail.com' }
        expect(ActionMailer::Base.deliveries.count).to eq(1)
        expect(ActionMailer::Base.deliveries.first.to).to eq([ 'test@mail.com' ])
      end
    end

    describe 'with invalid params' do
      
      before { Survey.any_instance.stub(:save).and_return(false) } 
      
      it 'assigns a newly created but unsaved survey as @survey' do
        post :create, survey: { email: '' }
        expect(assigns(:survey)).to be_a_new(Survey)
      end

      it 're-renders the "index" template' do
        post :create, survey: { email: '' }
        expect(response).to render_template('index')
      end
    end
  end
  
  describe 'GET edit' do
    
    context 'when the survey hasnt been responded before' do
      
      let!(:survey) { create(:survey, token: 'token') } 
      
      it 'assigns @survey' do
        get :edit, token: 'token'
        expect(assigns(:survey)).to eq(survey)
      end
    end
    
    context 'when the survey has been responded before' do
      
      let!(:survey) { create(:survey, token: 'token', responded_at: 2.hours.ago) } 
      
      it 'raises ActionController::RoutingError' do
        expect { get :edit, token: 'token' }.to raise_error(ActionController::RoutingError)
      end
    end
  end
  
  describe 'PATCH update' do
    
    let!(:user) { create(:user) }
    let!(:survey) { create(:survey, token: 'token') }
    
    before do
      ActionMailer::Base.deliveries = []
      login_user(user)
    end
    
    describe 'with valid params' do
      
      it 'updates the survey' do
        patch :update, token: 'token', survey: { rating: '5', comment: 'comment' }
        expect(survey.reload.rating).to eq(5)
        expect(survey.comment).to eq('comment')
      end

      it 'redirects to thank you page' do
        patch :update, token: 'token', survey: { rating: '5', comment: 'comment' }
        expect(response).to redirect_to(:survey_thank_you)
      end
    end

    describe 'with invalid params' do
      
      it 'assigns an invalid survey as @survey' do
        patch :update, token: 'token', survey: { rating: '', comment: '' }
        expect(assigns(:survey)).to be_invalid
      end

      it 're-renders the "edit" template' do
        patch :update, token: 'token', survey: { rating: '', comment: '' }
        expect(response).to render_template('edit')
      end
    end
  end
  
  describe 'POST search' do
    
    let!(:user) { create(:user) }
    let!(:survey) { create(:survey, token: 'token', comment: 'ruby is a great language', user: user) }
    
    before { login_user(user) }
    
    context 'when query parameter is present' do
      
      it 'searches by query and assigns @surveys array' do
        post :search, query: 'language'
        expect(assigns(:surveys)).to eq([ survey ])
      end
    end
    
    context 'when query parameter is empty' do
      
      it 'redirects to index' do
        post :search, query: ''
        expect(response).to redirect_to(surveys_url)
      end
    end
  end
end
