class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update]

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      render json: @survey, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @survey
  end

  def update
    if @survey.update(survey_params)
      render json: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Survey not found' }, status: :not_found
  end

  def survey_params
    # survey_data: [{"label"=>"test", "inputs"=>"test"}, {"label"=>"test", "inputs"=>"test"}]
    params.permit(:id, :name, :description, survey_data: [:label, :inputs])
  end
end
