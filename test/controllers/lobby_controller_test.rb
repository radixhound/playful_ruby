require "test_helper"

class LobbyControllerTest < ActionDispatch::IntegrationTest
  def login
  end

  test 'redirects when not logged in' do
    get lobby_path
    assert_response 302
    assert_includes "Sign up", @response.body
  end
end
