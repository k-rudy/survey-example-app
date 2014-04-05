class SurveysController < ApplicationController
  before_action :require_login, only: [ :index, :create, :search ]
  before_action :set_survey, only: [ :edit, :update ]
  
  respond_to :html

  # GET /surveys
  def index
    @survey = Survey.new
    set_surveys
  end

  # POST /surveys
  def create
    @survey =  Survey.create(create_survey_params)
    if @survey.persisted?
      UserMailer.survey_email(@survey).deliver
      redirect_to surveys_path, notice: t('surveys.create_message')
    else
      set_surveys
      render 'index'
    end  
  end
  
  # PUT /surveys/:token
  def update
    @survey.update_attributes(update_survey_params)
    flash[:notice] = t('surveys.update_message')
    respond_with @survey, location: survey_thank_you_path
  end
  
  # POST /surveys/search
  def search
    if params[:query].present?
      @surveys = Survey.search(params[:query], current_user.id)
      @survey = Survey.new
      render 'index'
    else
      redirect_to surveys_path
    end
  end

  private
  
  # Queries survey by token
  #
  # @raise [ ActionController::RoutingError ] if the survey was not found
  def set_survey
    @survey = Survey.by_token(params[:token])
    not_found unless @survey
  end
  
  def set_surveys
    @surveys = current_user.surveys
  end

  # Only allow a trusted parameter "white list" through.
  def create_survey_params
    params.require(:survey).permit(:email).merge(user: current_user)
  end

  # Only allow a trusted parameter "white list" through.
  def update_survey_params
    params.require(:survey).permit(:rating, :comment).merge(responded_at: Time.current)
  end
end
