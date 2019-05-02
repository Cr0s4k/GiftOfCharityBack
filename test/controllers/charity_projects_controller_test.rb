require 'test_helper'
require 'json'
require 'shoulda-context'

class CharityProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_all_charity_projects" do
    get charity_projects_path
    assert_response :success
  end

  test "should return available charity projects" do
    get charity_projects_path
    js = JSON.parse(response.body)
    expected = [
      {
        id: 1,
        name: "name1",
        imageUrl: "imageUrl1"
      },
      {
        id: 2,
        name: "name2",
        imageUrl: "imageUrl2"
      }
    ]
    expected = JSON.parse(expected.to_json)
    assert_same_elements expected, js
  end

  test "should get get_charity_project" do
    get charity_project_path(charity_projects(:one).id)
    assert_response :success
  end

  test "should return information about a charity project" do
    get charity_project_path(charity_projects(:one).id)

    json = JSON.parse(response.body)
    assert_not_nil json['id']
    assert_equal 'name1', json['name']
    assert_equal 'imageUrl1', json['imageUrl']
    assert_equal 'description1', json['description']
    assert_not_nil json['questionnaireId']
  end

  test "should return 404 with an unexistent id" do
    get charity_project_path(1000)
    assert_response 404
  end

  test "should return 404 with an incorrect id" do
    get charity_project_path('abcd')
    assert_response 404
  end

  test "should return 404 when finding a no-available charityProject" do
    get charity_project_path(charity_projects(:no_available).id)
    assert_response 404
  end
end
