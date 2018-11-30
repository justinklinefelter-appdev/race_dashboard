Rails.application.routes.draw do
  # Routes for the Race resource:

  # CREATE
  get("/races/new", { :controller => "races", :action => "new_form" })
  post("/create_race", { :controller => "races", :action => "create_row" })

  # READ
  get("/races", { :controller => "races", :action => "index" })
  get("/races/:id_to_display", { :controller => "races", :action => "show" })

  # UPDATE
  get("/races/:prefill_with_id/edit", { :controller => "races", :action => "edit_form" })
  post("/update_race/:id_to_modify", { :controller => "races", :action => "update_row" })

  # DELETE
  get("/delete_race/:id_to_remove", { :controller => "races", :action => "destroy_row" })

  #------------------------------

  # Routes for the Event resource:

  # CREATE
  get("/events/new", { :controller => "events", :action => "new_form" })
  post("/create_event", { :controller => "events", :action => "create_row" })

  # READ
  get("/events", { :controller => "events", :action => "index" })
  get("/events/:id_to_display", { :controller => "events", :action => "show" })

  # UPDATE
  get("/events/:prefill_with_id/edit", { :controller => "events", :action => "edit_form" })
  post("/update_event/:id_to_modify", { :controller => "events", :action => "update_row" })

  # DELETE
  get("/delete_event/:id_to_remove", { :controller => "events", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
