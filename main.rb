# gem dependencies
require 'sinatra'

require 'sinatra/reloader' if development? 
also_reload "models/company"
also_reload "models/event"

require 'pry'
require 'pg'

# requiring our own files, relative from where we are
require_relative 'models/company.rb'
require_relative 'models/event.rb'

get '/' do
  events = find_all_events
  erb :index, locals: { events: events}
end

get '/about' do 
  "this page is currently blank"
end

get '/events/new' do 
  erb :new_event
end

get '/events/:id' do
  event = find_one_event_by_id(params["id"])
  erb :show, locals: { event: event}
end

post '/session' do 
  company = find_one_company_by_name(params["company"])
  
  if company && BCrypt::Password.new(company["password_digest"]) == params["password"]

    session["company_id"] = company["company_id"]
    erb :company_events, locals: {company: session["company_id"],  }
    
  else
    redirect "/"
  end

end




