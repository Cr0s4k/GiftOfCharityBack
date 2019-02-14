require 'test_helper'
require 'json'
require 'shoulda-context'

class CharityProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get getAllCharityProjects" do
    get charity_project_getAllCharityProjects_url
    assert_response :success
  end

  test "should return charityProjects" do
    get '/charity_project/getAllCharityProjects'
    js = JSON.parse(response.body)
    expected = [
      {
        id: 1,
        name: "name1",
        price: 1,
        imageUrl: "imageUrl1"
      },
      {
        id: 2,
        name: "name2",
        price: 2,
        imageUrl: "imageUrl2"
      }
    ]
    expected = JSON.parse(expected.to_json)
    assert_same_elements js, expected
  end

end
