require 'test_helper'

class GuestnotesControllerTest < ActionController::TestCase
  setup do
    @guestnote = guestnotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guestnotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guestnote" do
    assert_difference('Guestnote.count') do
      post :create, :guestnote => @guestnote.attributes
    end

    assert_redirected_to guestnote_path(assigns(:guestnote))
  end

  test "should show guestnote" do
    get :show, :id => @guestnote.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @guestnote.to_param
    assert_response :success
  end

  test "should update guestnote" do
    put :update, :id => @guestnote.to_param, :guestnote => @guestnote.attributes
    assert_redirected_to guestnote_path(assigns(:guestnote))
  end

  test "should destroy guestnote" do
    assert_difference('Guestnote.count', -1) do
      delete :destroy, :id => @guestnote.to_param
    end

    assert_redirected_to guestnotes_path
  end
end
