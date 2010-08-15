require 'test_helper'

class DrawerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Drawer.new.valid?
  end
end
