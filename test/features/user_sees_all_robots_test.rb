require_relative '../test_helper'

class UserSeesAllRobotTest < FeatureTest
  def test_user_sees_index_of_robots
    create_robot_army
    visit('/robots')

    assert page.has_content?('1: Raobot')
    assert page.has_content?('3: Riobot')
  end
end
