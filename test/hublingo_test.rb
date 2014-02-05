require 'minitest/autorun'
require 'minitest/pride'
require 'hublingo'

class TestHublingo < MiniTest::Unit::TestCase

  def setup
    @hub = Hublingo.new
  end

  def test_pick
    @hub = Hublingo.new
    @hub.frequencies = {"Ruby" => 12, "Clojure" => 100, "Go" => 27, "Haskell" => 19}
    assert_equal("Clojure", @hub.pick)
    @hub.frequencies = {"Ruby" => 112, "Clojure" => 100, "Go" => 27, "Haskell" => 19}
    assert_equal("Ruby", @hub.pick)
    @hub.frequencies = {"Ruby" => 1, "Clojure" => 2, "JavaScript" => 13, "Go" => 7, "Haskell" => 9}
    assert_equal("JavaScript", @hub.pick)
  end
end