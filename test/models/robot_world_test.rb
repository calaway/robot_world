require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelper

  def test_it_can_create_a_robot
    robot_world.create({
      :name => "Reobot",
      :city => "denver",
      :state => "CO",
      :avatar => "guac",
      :birthdate => "1/1/70",
      :date_hired => "yesterday",
      :department => "swim team"
    })
    robot = robot_world.find(1)

    assert_equal("Reobot", robot.name)
    assert_equal(1, robot.id)
    assert_equal("denver", robot.city)
  end

  def test_it_returns_all_robots
    robot_world.create({
      :name => "Raobot",
      :city => "denver",
      :state => "CO",
      :birthdate => "1/1/70",
      :date_hired => "yesterday",
      :department => "swim team"
    })
    robot_world.create({
      :name => "Reobot",
      :city => "Boulder",
      :state => "CO",
      :birthdate => "1/1/70",
      :date_hired => "yesterday",
      :department => "swim team"
    })
    robot_world.create({
      :name => "Reobot",
      :city => "denver",
      :state => "CO",
      :birthdate => "1/1/70",
      :date_hired => "yesterday",
      :department => "swim team"
    })

  end
end
