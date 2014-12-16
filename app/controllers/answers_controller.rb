class AnswersController < ApplicationController
  def new
    render question_path(params[:question_id])
  end
end
