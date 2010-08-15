require 'test_helper'

class BottleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Bottle.new.valid?
  end
end
