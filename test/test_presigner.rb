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

  test "check Presigner.new without optional arguments" do
    presigner = Presigner.new(bucket: 'foobucket',
                              key: 'barkey')
    ## maybe < 2 sec.
    assert_true(presigner.base < Time.now.to_i + 2 && presigner.base > Time.now.to_i - 1)
    assert_equal(Presigner::DEFAULT_DURATION, presigner.duration)
    assert_equal("us-east-1", presigner.region)
  end

  test "check Presigner.new with optional arguments" do
    presigner = Presigner.new(bucket: 'foobucket',
                              key: 'barkey',
                              duration: 123,
                              region: 'ap-northeast-1',
                              )
    assert_equal(123, presigner.duration)
    assert_equal("ap-northeast-1", presigner.region)
  end

end
