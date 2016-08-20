ENV["RACK_ENV"] || "test"
require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "tilt/erb"

module TestHelper
  def teardown
    robot_world.destroy_all
    super
  end

  def robot_world
    database = YAML::Store.new('db/robot_world_test')
    @robot_world ||= RobotWorld.new(database)
  end
end
