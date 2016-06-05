require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { budget_margin: @client.budget_margin, budget_margin: @client.budget_margin, budget_revenue: @client.budget_revenue, client: @client.client, completion_date: @client.completion_date, completion_month: @client.completion_month, project_name: @client.project_name, project_status: @client.project_status, project_status: @client.project_status }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { budget_margin: @client.budget_margin, budget_margin: @client.budget_margin, budget_revenue: @client.budget_revenue, client: @client.client, completion_date: @client.completion_date, completion_month: @client.completion_month, project_name: @client.project_name, project_status: @client.project_status, project_status: @client.project_status }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
