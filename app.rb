require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'
require 'pry'

require_relative 'config/application'

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end
get '/' do
  redirect '/meetups'
end

get '/meetups' do
  meetups = Meetup.all.order(:name)
  erb :index, locals: {meetups: meetups, confirmation: params[:confirmation]}
end

get "/meetups/:id" do
  meetup = Meetup.find(params[:id])
  join_group = Event.new
  erb :meetup, locals: { meetup: meetup, join_group: join_group, join_confirmation: params[:join_confirmation]}
end

post "/meetups/:id" do
  event_hash = {meetup_id:"#{params[:id]}", user_id:"#{session[:user_id]}"}
  join_group = Event.new(event_hash)
  join_confirmation = ''
  if join_group.save
    join_confirmation = "You have joined a group"
    redirect "/meetups/#{params[:id]}"
  else
    erb :meetup, locals: { join_group: join_group, join_confirmation: join_confirmation}
  end
end

get '/create_meetup' do
  authenticate!
  meetup = Meetup.new
  erb :create_meetup, locals: { meetup: meetup}
end

post '/create_meetup' do
  confirmation = ''
  meetup = Meetup.new(params[:meetup])
  if meetup.save && user.signed_in?
    confirmation = "You have added an "
    redirect "/meetups?confirmation=#{confirmation.gsub(" ", "%20")}"
  else
    erb :create_meetup, locals: {meetup: meetup}
  end
end


get '/auth/github/callback' do
  auth = env['omniauth.auth']

  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/example_protected_page' do
  authenticate!
end
