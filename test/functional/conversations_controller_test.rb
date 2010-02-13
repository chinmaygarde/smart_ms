require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conversations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conversation" do
    assert_difference('Conversation.count') do
      post :create, :conversation => { }
    end

    assert_redirected_to conversation_path(assigns(:conversation))
  end

  test "should show conversation" do
    get :show, :id => conversations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => conversations(:one).to_param
    assert_response :success
  end

  test "should update conversation" do
    put :update, :id => conversations(:one).to_param, :conversation => { }
    assert_redirected_to conversation_path(assigns(:conversation))
  end

  test "should destroy conversation" do
    assert_difference('Conversation.count', -1) do
      delete :destroy, :id => conversations(:one).to_param
    end

    assert_redirected_to conversations_path
  end
end
