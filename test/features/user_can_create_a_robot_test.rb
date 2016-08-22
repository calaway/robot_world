require_relative '../test_helper'

class UserCanCreateRobotTest < FeatureTest
  def test_user_can_create_a_robot
    visit('/robots/new')

    fill_in('robot[name]', with: 'Ribbit')

    click_button('submit')
    assert page.has_content?('Ribbit')
  end
end
