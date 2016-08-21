ENV["RACK_ENV"] ||= "test"
ENV['TASK_MANAGER_ENV'] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "tilt/erb"
require 'capybara/DSL'

module TestHelper
  def teardown
    robot_world.destroy_all
    super
  end

  def create_robot_army
    robot_world.create({
      :name => "Raobot",
      :city => "denver",
      :state => "CO",
      :birthdate => "2016-02-04",
      :date_hired => "2016-08-07",
      :department => "swim team"
    })
    robot_world.create({
      :name => "Reobot",
      :city => "Boulder",
      :state => "CO",
      :birthdate => "2016-02-05",
      :date_hired => "2016-08-08",
      :department => "swim team"
    })
    robot_world.create({
      :name => "Riobot",
      :city => "Downtown",
      :state => "CO",
      :birthdate => "2016-02-06",
      :date_hired => "2016-08-09",
      :department => "swim team"
    })
  end

  def last_robot
    robot_world.all.last
  end

  def robot_world
    database = YAML::Store.new('db/robot_world_test')
    RobotWorld.new(database)
  end
end

Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelper
end
