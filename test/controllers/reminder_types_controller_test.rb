require "test_helper"

class ReminderTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reminder_type = reminder_types(:one)
  end

  test "should get index" do
    get reminder_types_url
    assert_response :success
  end

  test "should get new" do
    get new_reminder_type_url
    assert_response :success
  end

  test "should create reminder_type" do
    assert_difference('ReminderType.count') do
      post reminder_types_url, params: { reminder_type: { name: @reminder_type.name } }
    end

    assert_redirected_to reminder_type_url(ReminderType.last)
  end

  test "should show reminder_type" do
    get reminder_type_url(@reminder_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_reminder_type_url(@reminder_type)
    assert_response :success
  end

  test "should update reminder_type" do
    patch reminder_type_url(@reminder_type), params: { reminder_type: { name: @reminder_type.name } }
    assert_redirected_to reminder_type_url(@reminder_type)
  end

  test "should destroy reminder_type" do
    assert_difference('ReminderType.count', -1) do
      delete reminder_type_url(@reminder_type)
    end

    assert_redirected_to reminder_types_url
  end
end
