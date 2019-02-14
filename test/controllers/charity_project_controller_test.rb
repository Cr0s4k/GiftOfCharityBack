require 'test_helper'
require 'json'
require 'shoulda-context'

class CharityProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get getAllCharityProjects" do
    get charity_project_getAllCharityProjects_url
    assert_response :success
  end

  test "should return charityProjects" do
    get '/charity_projects'
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
    assert_same_elements expected, js
  end

  test "should get getCharityProjectInformation" do
    get "/charity_projects/1"
    assert_response :success
  end

  test "should return information about a charity project" do
    get '/charity_projects/1'
    js = JSON.parse(response.body)
    expected = {
        id: 1,
        name: "name1",
        price: 1,
        imageUrl: "imageUrl1",
        description: "description1"
    }
    expected = JSON.parse(expected.to_json)
    assert_equal expected, js
  end

  test "should return 404 with an unexistent id" do
    get '/charity_projects/1000'
    assert_response 404
  end

  test "should return 404 with an incorrect id" do
    get '/charity_projects/abcd'
    assert_response 404
  end
end
