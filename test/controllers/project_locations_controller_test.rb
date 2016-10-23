require 'test_helper'

class ProjectLocationsControllerTest < ActionController::TestCase
  setup do
    @project_location = project_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_location" do
    assert_difference('ProjectLocation.count') do
      post :create, project_location: { location: @project_location.location, region: @project_location.region }
    end

    assert_redirected_to project_location_path(assigns(:project_location))
  end

  test "should show project_location" do
    get :show, id: @project_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_location
    assert_response :success
  end

  test "should update project_location" do
    patch :update, id: @project_location, project_location: { location: @project_location.location, region: @project_location.region }
    assert_redirected_to project_location_path(assigns(:project_location))
  end

  test "should destroy project_location" do
    assert_difference('ProjectLocation.count', -1) do
      delete :destroy, id: @project_location
    end

    assert_redirected_to project_locations_path
  end
end
