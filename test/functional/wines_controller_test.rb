require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  test "should route properly" do
    assert_recognizes({:controller => "wines", :action => "index"}, :path => wines_path)
    assert_recognizes({:controller => "wines", :action => "create"}, {:path => wines_path, :method => "post"})
    assert_recognizes({:controller => "wines", :action => "update", :id => "99"}, {:path => "#{wines_path}/99", :method => "put"})
    # assert_generates is the most generous in require only partial path (i.e. no method mentioned)
    assert_generates wines_path, :controller => :wines
    assert_generates wines_path, :controller => :wines, :action => :index
    assert_generates wines_path, :controller => :wines, :action => :create
    assert_generates new_wine_path, :controller => :wines, :action => :new
    assert_generates "wines/99", :controller => :wines, :action => :show, :id => 99
    assert_generates "#{wines_path}/99", :controller => :wines, :action => :show, :id => 99
    assert_generates "#{wines_path}/99", :controller => :wines, :action => :update, :id => 99
    assert_generates "#{wines_path}/99", :controller => :wines, :action => :destroy, :id => 99
    assert_generates "#{wines_path}/new", :controller => :wines, :action => :new
    assert_routing "#{wines_path}/new", :controller => "wines", :action => "new"
    assert_routing({:path => wines_path}, {:controller => "wines", :action => "index"})
    assert_routing({:method => :get, :path => wines_path}, {:controller => "wines", :action => "index"})
    assert_routing({:method => :post, :path => wines_path}, {:controller => "wines", :action => "create"})
    assert_routing({:method => :put, :path => "#{wines_path}/99"}, {:controller => "wines", :action => "update", :id => "99"})
    assert_routing({:method => :delete, :path => "#{wines_path}/99"}, {:controller => "wines", :action => "destroy", :id => "99"})
    assert_routing({:path => new_wine_path}, {:controller => "wines", :action => "new"})
    assert_routing({:method => :get, :path => new_wine_path}, {:controller => "wines", :action => "new"})
    assert_routing({:path => "wines/99/edit"}, {:controller => "wines", :action => "edit", :id => "99"})
    assert_routing({:method => :get, :path => "wines/99/edit"}, {:controller => "wines", :action => "edit", :id => "99"})
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wines)
    assert_nil assigns(:wine)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:wine).new_record?
  end

  test "should create wine" do
    assert_difference('Wine.count') do
      post :create, :wine => {:name => "test name", :item_no => 12345 }
    end

    assert_response :redirect
    assert_redirected_to wine_path(assigns(:wine))
    assert !assigns(:wine).new_record?
  end

  test "should show wine" do
    get :show, :id => wines(:primus).to_param
    assert_response :success
    assert_not_nil assigns(:wine)

    #assert_template "users/moo"
    #assert_not_nil assigns(:foo)
  end

  test "should edit wine" do
    get :edit, :id => wines(:primus).to_param
    assert_response :success
    assert_not_nil assigns(:wine)
  end

  test "should update wine" do
    put :update, :id => wines(:primus).to_param, :wine => { }
    assert_redirected_to wine_path(assigns(:wine))
    assert_not_nil assigns(:wine)
  end

  test "should destroy wine" do
    assert_difference('Wine.count', -1) do
      delete :destroy, :id => wines(:primus).to_param
    end

    assert_redirected_to wines_path
    assert assigns(:wine).destroyed?
  end
end
