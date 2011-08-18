require "test_helper"

class PigLatinTest < ActiveSupport::TestCase

  context "'hello world'" do
    should "be translated to 'ellohay orldway'" do
      assert_equal 'ellohay orldway', PigLatin.translate('hello world')
    end
  end

  context "'Hello World'" do
    should "be translated to 'Ellohay Orldway'" do
      assert_equal 'Ellohay Orldway', PigLatin.translate('Hello World')
    end
  end

end