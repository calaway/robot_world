class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  # not_found do
  #   erb :error
  # end

  # Show homepage
  get '/' do
    erb :dashboard
  end

  # Show all robots
  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  # Show new robot form
  get '/robots/new' do
    erb :new
  end

  # Process new robot form
  post '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  # Show individual robot
  get '/robots/:id' do |id|
    @robot = robot_world.find(id.to_i)
    erb :show
  end

  # Show form to edit a robot
  get '/robots/:id/edit' do |id|
    @robot = robot_world.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_world.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_world.destroy(id.to_i)
    redirect "/robots"
  end

  # Load or create database and return instance of RobotWorld
  def robot_world
    database = YAML::Store.new('db/robot_world')
    @robot_world ||= RobotWorld.new(database)
  end
end
