require 'test_helper'

class TimeZonesControllerTest < ActionController::TestCase
  setup do
    @time_zone = time_zones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_zone" do
    assert_difference('TimeZone.count') do
      post :create, time_zone: { code: @time_zone.code, difference_type: @time_zone.difference_type, name: @time_zone.name, time_difference: @time_zone.time_difference }
    end

    assert_redirected_to time_zone_path(assigns(:time_zone))
  end

  test "should show time_zone" do
    get :show, id: @time_zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_zone
    assert_response :success
  end

  test "should update time_zone" do
    put :update, id: @time_zone, time_zone: { code: @time_zone.code, difference_type: @time_zone.difference_type, name: @time_zone.name, time_difference: @time_zone.time_difference }
    assert_redirected_to time_zone_path(assigns(:time_zone))
  end

  test "should destroy time_zone" do
    assert_difference('TimeZone.count', -1) do
      delete :destroy, id: @time_zone
    end

    assert_redirected_to time_zones_path
  end
end
