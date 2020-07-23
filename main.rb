# gem dependencies
require 'sinatra'

require 'sinatra/reloader' if development? 
# also_reload "models/company" if development? 
# also_reload "models/event" if development? 

require 'pg'

# requiring our own files, relative from where we are
require_relative 'models/company.rb'
require_relative 'models/event.rb'

enable :sessions

def logged_in? 
  return !!session["company_id"]
end

def current_company
  find_one_company_by_company_id(session["company_id"]) 
end

get '/' do
  events = find_all_events
  erb :index, locals: { events: events, error_message: ""}
end

get '/about' do 
  erb :about 
end

get '/events/new' do 
  erb :new_event
end

get '/events/:id' do
  event = find_one_event_by_id(params["id"])
  erb :show, locals: { event: event}
end

post '/events' do 
  create_event(session["company_id"], params["event_type"], params["event_date"], params["venue"], params["guests"], params["theme"], params["budget"], params["image_url"])
  redirect '/dashboard'
end

post '/session' do 
  company = find_one_company_by_name(params["company"])
  
  if company && BCrypt::Password.new(company["password_digest"]) == params["password"]

    session["company_id"] = company["company_id"]
    redirect "/dashboard"
  else
    events = find_all_events
    erb :index, locals: {events: events, error_message: "Incorrect company name and/or password. Please try again."}
  end

end

get '/dashboard' do 
  company = current_company
  events = find_all_events_by_company_id(session["company_id"])
  erb :company_events, locals: {company: company, events: events }
end

delete '/session' do 
  session["company_id"] = nil
  redirect "/"
end

get '/events/:id/edit' do
  event_hash = find_one_event_by_id(params["id"])
  erb :edit_event, locals: {event: event_hash}
end

patch '/events/:id' do

  update_event(params["id"], params["event_type"], params["event_date"], params["venue"], params["guests"], params["theme"], params["budget"], params["image_url"], params["notes"])
  
  redirect "/dashboard"
end

patch '/events/:id/notes' do 
  update_notes(params["id"], params["notes"])
  redirect "/dashboard"
end

