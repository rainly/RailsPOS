require 'test_helper'

class MiscTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Misc.new.valid?
  end
end
