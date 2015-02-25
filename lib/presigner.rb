require "presigner/version"

require 'aws-sdk-v1'
require 'pry'

class Presigner

  DEFAULT_DURATION = 60 * 30

  def initialize(options)
    @bucket = options[:bucket]
    @key = options[:key]
    @duration = options[:duration].nil? ? DEFAULT_DURATION : options[:duration].to_i
    @base = Time.now.to_i
  end

  attr_reader :duration, :base, :bucket, :key

  def generate

    s3 = AWS::S3.new
    # check if specified bucket and key exist.
    target_obj = s3.buckets[bucket].objects[key]
    if !target_obj.exists?
      $stderr.puts "Specified bucket or key does not exist."
      exit 1
    end

    presigner = AWS::S3::PresignV4.new(target_obj)
    expires = calc_duration

    url = presigner.presign(:get, expires: expires, secure: true)
    url
  end

  def calc_duration
    base + duration
  end
end
