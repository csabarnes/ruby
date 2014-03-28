require 'test/unit'
require "-test-/struct"

class  Bug::Struct::Test_Member < Test::Unit::TestCase
  S = Bug::Struct.new(:a)

  def test_member_get
    s = S.new(1)
    assert_equal(1, s.get(:a))
    assert_raise_with_message(NameError, /is not a struct member/) {s.get(:b)}
  end
end
