require_relative '../test_helper'

class UserSeesAllRobotTest < FeatureTest

  def test_user_sees_index_of_robots
    create_robot_army
    visit('/robots')

    assert page.has_content?('1: Raobot')
    assert page.has_content?('3: Riobot')
  end

  def test_user_can_create_edit_and_delete_a_robot
    visit('/robots/new')

    fill_in('robot[name]', with: 'Ribbit')

    click_button 'submit'
    assert page.has_content?('Ribbit')

    save_and_open_page
  end
  # save_and_open_page
end
