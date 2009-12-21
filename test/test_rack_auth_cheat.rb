require 'test/unit'
require 'rack/auth/cheat'

class TC_Rack_Auth_Cheat < Test::Unit::TestCase
  def setup
    @app  = 1 # Placeholder
    @env  = 1 # Placeholder
    @rack = Rack::Auth::Cheat.new(@app)
  end

  def test_constructor_basic
    assert_nothing_raised{ Rack::Auth::Cheat.new(@app) }
  end

  def test_version
    assert_equal('0.1.0', Rack::Auth::Cheat::VERSION)
  end

  def teardown
    @rack = nil
  end
end
