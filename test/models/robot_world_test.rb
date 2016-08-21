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
    assert_equal 0, robot_world.all.count

    create_robot_army

    assert_equal 3, robot_world.all.count
  end

  def test_it_can_find_a_robot
    create_robot_army

    assert_instance_of Robot, robot_world.find(last_robot.id)
    assert_equal "Riobot", robot_world.find(last_robot.id).name
  end

  def test_it_can_update_a_robot
    create_robot_army

    assert_equal "Riobot", last_robot.name

    update_data = {:name => "Raobot",
                   :city => "denver",
                   :state => "co",
                   :avatar => "pantalones",
                   :birthdate => "tuesday",
                   :date_hired => "tuesday",
                   :department => "funemployed"}

    robot_world.update(last_robot.id, update_data)
    assert_equal "Raobot", last_robot.name
  end

  def test_it_can_destroy_a_robot
    create_robot_army
    assert_equal 3, robot_world.all.length

    robot_world.destroy(last_robot.id)
    assert_equal 2, robot_world.all.length
  end
end
