require "test_helper"

class WhyNots::PigLatinTest < ActiveSupport::TestCase

  context "'hello world'" do
    should "be translated to 'ellohay orldway'" do
      assert_equal 'ellohay orldway', WhyNots::PigLatin.translate('hello world')
    end
  end

  context "'Hello World'" do
    should "be translated to 'Ellohay Orldway'" do
      assert_equal 'Ellohay Orldway', WhyNots::PigLatin.translate('Hello World')
    end
  end

  context "'Hello World!!!'" do
    should "be translated to 'Ellohay Orldway!!!'" do
      assert_equal 'Ellohay Orldway!!!', WhyNots::PigLatin.translate('Hello World!!!')
    end
  end

end