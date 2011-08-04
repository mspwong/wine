require 'test_helper'

class WineTest < ActiveSupport::TestCase

 test "find non existing wine" do
    wine = Wine.find_by_name("Not to be found")
    assert !wine
  end

  test "find wine by name" do
    wine = Wine.find_by_name("Veramonte Primus")
    assert wine
  end

  test "save wine with duplicate name" do
    wine = Wine.new(:name => "Veramonte Primus")
    assert !wine.save
  end

  test "save wine without item no" do
    wine = Wine.new(:name => "Test wine")
    assert !wine.save
  end

  test "save wine with non-integer item no" do
    wine = Wine.new(:name => "Test wine", :item_no => "i'm not an integer")
    assert !wine.save
  end

  test "save valid wine" do
    wine = Wine.new(:name => "Test wine", :item_no => 12345)
    assert wine.save
  end

  test "update wine synchronizes its reviews status" do
    wine = wines(:primus)
    assert wine.active
    assert wine.reviews
    assert_equal 2, wine.reviews.size
    wine.reviews.each { |r| assert r.active }

    wine.update_attribute(:active, false)
    assert !wine.active
    assert wine.reviews
    assert_equal 2, wine.reviews.size
    wine.reviews.each { |r| assert !r.active }
  end

end
