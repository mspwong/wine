require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get ajax page" do
    get :ajax_page
    assert_response :success
  end

  test "should get wines" do
    get :get_wines
    assert_response :success
    assert_not_nil @response.body
    assert @response.status.include? "200"
    #json = JSON.parse(@response.body)
    #assert json
  end

  test "should get wine by known id" do
    get :get_wine, {:id => 1}
    assert_response :success
    assert @response.status.include? "200"
  end

  test "should not get wine of unknown id" do
    get :get_wine, {:id => 99999}
    assert_response :success
    assert @response.status.include? "204"
    assert !(@response.status.include? "200")
  end

  test "should post wine by known id" do
    post :get_wine, {:id => 1}
    assert_response :success
    assert @response.status.include? "200"
  end

  test "should post get wine of unknown id" do
    post :post_wine, {:id => 99999}
    assert_response :success
    assert @response.status.include? "204"
    assert !(@response.status.include? "200")
  end

end