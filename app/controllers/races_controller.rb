class RacesController < ApplicationController
  def index
    @races = Race.all

    render("race_templates/index.html.erb")
  end

  def show
    @race = Race.find(params.fetch("id_to_display"))

    render("race_templates/show.html.erb")
  end

  def new_form
    @race = Race.new

    render("race_templates/new_form.html.erb")
  end

  def create_row
    @race = Race.new

    @race.name = params.fetch("name")
    @race.event_id = params.fetch("event_id")
    @race.year_id = params.fetch("year_id")
    @race.location_id = params.fetch("location_id")

    if @race.valid?
      @race.save

      redirect_back(:fallback_location => "/races", :notice => "Race created successfully.")
    else
      render("race_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @race = Race.find(params.fetch("prefill_with_id"))

    render("race_templates/edit_form.html.erb")
  end

  def update_row
    @race = Race.find(params.fetch("id_to_modify"))

    @race.name = params.fetch("name")
    @race.event_id = params.fetch("event_id")
    @race.year_id = params.fetch("year_id")
    @race.location_id = params.fetch("location_id")

    if @race.valid?
      @race.save

      redirect_to("/races/#{@race.id}", :notice => "Race updated successfully.")
    else
      render("race_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_event
    @race = Race.find(params.fetch("id_to_remove"))

    @race.destroy

    redirect_to("/events/#{@race.event_id}", notice: "Race deleted successfully.")
  end

  def destroy_row
    @race = Race.find(params.fetch("id_to_remove"))

    @race.destroy

    redirect_to("/races", :notice => "Race deleted successfully.")
  end
end
