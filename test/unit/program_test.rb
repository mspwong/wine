require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  def setup
    @program = programs(:discount)
    assert_equal "discount", @program.name
  end
  subject{ @program }

  should_have_and_belong_to_many :users

  context "Given a program" do
    should "be able to navigate to its members" do
      assert_equal 1, @program.users.size
    end
  end
end
