require 'test_helper'

class TabTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tab.new.valid?
  end
end
