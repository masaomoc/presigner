require "presigner/version"

require 'aws-sdk-v1'

class Presigner

  DEFAULT_DURATION = 60 * 30

  def initialize(options)
    @bucket = options[:bucket]
    @key = options[:key]
    @duration = options[:duration] || DEFAULT_DURATION
    @region = options[:region] || "us-east-1"
    @base = Time.now.to_i
  end

  attr_reader :duration, :base, :bucket, :key, :region

  def generate

    s3 = AWS::S3.new(region: region)
    # check if specified bucket and key exist.
    begin
      target_obj = s3.buckets[bucket].objects[key]
      if !target_obj.exists?
        $stderr.puts "Specified bucket or key does not exist."
        exit 1
      end
    rescue AWS::S3::Errors::Forbidden
      $stderr.puts "Access to the S3 object is denied. Credential or target name might be wrong"
      exit 1
    end

    if !target_obj.exists?
      $stderr.puts "Specified bucket or key does not exist."
      exit 1
    end

    presigner = AWS::S3::PresignV4.new(target_obj)
    expires = calc_duration

    url = presigner.presign(:get, expires: base + duration, secure: true)
    url
  end

  def calc_duration
    duration
  end
end
