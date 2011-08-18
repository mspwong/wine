require "test_helper"

class PigLatinTest < ActiveSupport::TestCase

  context "" do
    should "fail" do
      assert_equal "ellohay orldway", PigLatin.translate("hello world")
    end
  end

end