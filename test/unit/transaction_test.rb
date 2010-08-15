require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Transaction.new.valid?
  end
end
