require_relative "../test_helper"

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({
      "id" => 1,
      "name" => "Raobot",
      "city" => "slc",
      "state" => "PA",
      "birthdate" => "01/01/1970",
      "date_hired" => "10/11/2012",
      "department" => "Mergers & Acquisitions"
    })

    assert_equal "Raobot", robot.name
    assert_equal "slc", robot.city
    assert_equal "PA", robot.state
    assert_equal "01/01/1970", robot.birthdate
    assert_equal "10/11/2012", robot.date_hired
    assert_equal "Mergers & Acquisitions", robot.department
  end
end
