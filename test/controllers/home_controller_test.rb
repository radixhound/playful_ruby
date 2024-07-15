require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'displays the title and description' do
    get root_path
    assert_response 200
    assert_includes "Playful Ruby", @response.body
    assert_includes "Playful Ruby is a hillariously weird game of tag
    played on a hex board where you navigate using VIM key bindings.
    It is implemented in Ruby using Hotwire.", @response.body
  end
end
