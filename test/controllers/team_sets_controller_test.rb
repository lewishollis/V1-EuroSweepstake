require "test_helper"

class TeamSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_sets_index_url
    assert_response :success
  end
end
