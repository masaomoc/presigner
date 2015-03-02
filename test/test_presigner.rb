require 'test/unit'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'presigner'

class PresignerTest < Test::Unit::TestCase
  class << self
    def startup
    end

    def shutdown
    end
  end

  def setup
    options = {
      :bucket => 'foobucket',
      :key => 'barkey'
    }
    @presigner = Presigner.new(options)
  end

  def cleanup
  end

  def teardown
  end

  test "check if duration calculation is correct" do
    actual = @presigner.calc_duration
    assert_equal(actual, Presigner::DEFAULT_DURATION)
  end

end
