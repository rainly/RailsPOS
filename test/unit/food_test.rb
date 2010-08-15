require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Food.new.valid?
  end
end
