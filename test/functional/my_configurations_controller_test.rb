require 'test_helper'

class MyConfigurationsControllerTest < ActionController::TestCase
  setup do
    @my_configuration = my_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_configuration" do
    assert_difference('MyConfiguration.count') do
      post :create, my_configuration: { config_key: @my_configuration.config_key, config_value: @my_configuration.config_value }
    end

    assert_redirected_to my_configuration_path(assigns(:my_configuration))
  end

  test "should show my_configuration" do
    get :show, id: @my_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_configuration
    assert_response :success
  end

  test "should update my_configuration" do
    put :update, id: @my_configuration, my_configuration: { config_key: @my_configuration.config_key, config_value: @my_configuration.config_value }
    assert_redirected_to my_configuration_path(assigns(:my_configuration))
  end

  test "should destroy my_configuration" do
    assert_difference('MyConfiguration.count', -1) do
      delete :destroy, id: @my_configuration
    end

    assert_redirected_to my_configurations_path
  end
end
