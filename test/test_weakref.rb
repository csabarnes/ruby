require 'test/unit'
require 'weakref'

class TestWeakRef < Test::Unit::TestCase
  def make_weakref
    obj = Object.new
    return WeakRef.new(obj), obj.to_s
  end

  def test_ref
    weak, str = make_weakref
    assert_equal(str, weak.to_s)
  end

  def test_recycled
    weak, str = make_weakref
    assert_nothing_raised(WeakRef::RefError) {weak.to_s}
    ObjectSpace.garbage_collect
    ObjectSpace.garbage_collect
    assert_raise(WeakRef::RefError) {weak.to_s}
  end
end
