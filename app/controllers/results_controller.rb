class ResultsController < ApplicationController
  before_action :current_user_must_be_result_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_result_user
    result = Result.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == result.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Result.ransack(params[:q])
    @results = @q.result(:distinct => true).includes(:user, :race, :comments).page(params[:page]).per(10)

    render("result_templates/index.html.erb")
  end

  def show
    @comment = Comment.new
    @result = Result.find(params.fetch("id_to_display"))

    render("result_templates/show.html.erb")
  end

  def new_form
    @result = Result.new

    render("result_templates/new_form.html.erb")
  end

  def create_row
    @result = Result.new

    @result.user_id = params.fetch("user_id")
    @result.race_id = params.fetch("race_id")
    @result.time = params.fetch("time")
    @result.overall_place_id = params.fetch("overall_place_id")
    @result.age_group_place_id = params.fetch("age_group_place_id")
    @result.body = params.fetch("body")

    if @result.valid?
      @result.save

      redirect_back(:fallback_location => "/results", :notice => "Result created successfully.")
    else
      render("result_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_race
    @result = Result.new

    @result.user_id = params.fetch("user_id")
    @result.race_id = params.fetch("race_id")
    @result.time = params.fetch("time")
    @result.overall_place_id = params.fetch("overall_place_id")
    @result.age_group_place_id = params.fetch("age_group_place_id")
    @result.body = params.fetch("body")

    if @result.valid?
      @result.save

      redirect_to("/races/#{@result.race_id}", notice: "Result created successfully.")
    else
      render("result_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @result = Result.find(params.fetch("prefill_with_id"))

    render("result_templates/edit_form.html.erb")
  end

  def update_row
    @result = Result.find(params.fetch("id_to_modify"))

    
    @result.race_id = params.fetch("race_id")
    @result.time = params.fetch("time")
    @result.overall_place_id = params.fetch("overall_place_id")
    @result.age_group_place_id = params.fetch("age_group_place_id")
    @result.body = params.fetch("body")

    if @result.valid?
      @result.save

      redirect_to("/results/#{@result.id}", :notice => "Result updated successfully.")
    else
      render("result_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @result = Result.find(params.fetch("id_to_remove"))

    @result.destroy

    redirect_to("/users/#{@result.user_id}", notice: "Result deleted successfully.")
  end

  def destroy_row_from_race
    @result = Result.find(params.fetch("id_to_remove"))

    @result.destroy

    redirect_to("/races/#{@result.race_id}", notice: "Result deleted successfully.")
  end

  def destroy_row
    @result = Result.find(params.fetch("id_to_remove"))

    @result.destroy

    redirect_to("/results", :notice => "Result deleted successfully.")
  end
end
