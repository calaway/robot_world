require_relative '../test_helper'

class UserSeesAllRobotTest < FeatureTest
  def test_user_sees_index_of_robots
    create_robot_army
    visit('/robots')
save_and_open_page
    assert page.has_content?('Raobot')
    assert page.has_content?('Reobot')
    assert page.has_content?('Riobot')
  end
end
