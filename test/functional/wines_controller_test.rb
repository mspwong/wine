require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  test "should route properly" do
    assert_generates wines_path, :controller => "wines"
    assert_generates new_wine_path, :controller => "wines", :action => "new"
    assert_generates "wines/1", :controller => "wines", :action => "show", :id => 1
    assert_generates "#{wines_path}/1", :controller => "wines", :action => "show", :id => 1
    assert_generates "#{wines_path}/new", :controller => "wines", :action => "new"
    assert_routing "#{wines_path}/new", :controller => "wines", :action => "new"
    assert_routing ( {:method => 'post', :path => wines_path}, {:controller => "wines", :action => "create"} )
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wine" do
    assert_difference('Wine.count') do
      post :create, :wine => {:name => "test name", :item_no => 12345 }
    end

    assert_response :redirect
    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should show wine" do
    get :show, :id => wines(:primus).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wines(:primus).to_param
    assert_response :success
  end

  test "should update wine" do
    put :update, :id => wines(:primus).to_param, :wine => { }
    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should destroy wine" do
    assert_difference('Wine.count', -1) do
      delete :destroy, :id => wines(:primus).to_param
    end

    assert_redirected_to wines_path
  end
end
