require_relative '../test_helper'

class UserCanDeleteRobotTest < FeatureTest
  def test_user_can_create_edit_and_delete_a_robot
    visit('/robots/new')

    fill_in('robot[name]', with: 'Ribbit')

    click_button('submit')
    assert page.has_content?('Ribbit')

    click_link('Ribbit')

    click_button('delete')
    refute page.has_content?('Ribbit')
  end
end
