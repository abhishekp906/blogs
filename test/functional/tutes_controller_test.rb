require 'test_helper'

class TutesControllerTest < ActionController::TestCase
  setup do
    @tute = tutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tute" do
    assert_difference('Tute.count') do
      post :create, tute: { episode: @tute.episode, title: @tute.title }
    end

    assert_redirected_to tute_path(assigns(:tute))
  end

  test "should show tute" do
    get :show, id: @tute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tute
    assert_response :success
  end

  test "should update tute" do
    put :update, id: @tute, tute: { episode: @tute.episode, title: @tute.title }
    assert_redirected_to tute_path(assigns(:tute))
  end

  test "should destroy tute" do
    assert_difference('Tute.count', -1) do
      delete :destroy, id: @tute
    end

    assert_redirected_to tutes_path
  end
end
