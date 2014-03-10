class SurveysController < ApplicationController
  before_action :require_login, only: [ :index, :create ]
  before_action :set_survey, only: [ :edit, :update ]
  
  respond_to :html

  # GET /surveys
  def index
    @surveys = current_user.surveys
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # POST /surveys
  def create
    @survey = Survey.create(create_survey_params)
    respond_with @survey, notice: t('surveys.create_message')
  end
  
  # PUT /surveys/:token
  def update
    @survey.update_attributes(update_survey_params)
    respond_with @survey, location: 'thank_you', notice: t('surveys.update_message')
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.by_token(params[:token])
  end

  # Only allow a trusted parameter "white list" through.
  def create_survey_params
    params.require(:survey).permit(:email).merge(user: current_user)
  end

  # Only allow a trusted parameter "white list" through.
  def update_survey_params
    params.require(:survey).permit(:rating, :comment)
  end
end
