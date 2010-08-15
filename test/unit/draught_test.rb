require 'test_helper'

class DraughtTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Draught.new.valid?
  end
end
