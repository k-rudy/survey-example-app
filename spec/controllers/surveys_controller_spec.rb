require 'spec_helper'

describe SurveysController do
  
  it_behaves_like 'user-only for', [ :index, { create: :post } ]

  describe 'GET index' do
    
    let!(:survey) { create(:survey) }
    
    it 'assigns all surveys as @surveys' do
      get :index
      expect(assigns(:surveys)).to eq([ survey ])
    end
  end

  describe 'GET new' do
    
    it 'assigns a new survey as @survey' do
      get :new
      expect(assigns(:survey)).to be_a_new(Survey)
    end
  end

  describe 'POST create' do
    
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
    end

    describe 'with invalid params' do
      
      before { Survey.any_instance.stub(:save).and_return(false) } 
      
      it 'assigns a newly created but unsaved survey as @survey' do
        post :create, survey: { email: '' }
        expect(assigns(:survey)).to be_a_new(Survey)
      end

      it 're-renders the "new" template' do
        post :create, survey: { email: '' }
        expect(response).to render_template('new')
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
end
