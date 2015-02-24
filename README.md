# Presigner

Presigner is a CLI tool to generate Pre-Signed URL for Amazon S3.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'presigner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install presigner

## Usage

```bash
$ presigner --bucket foobucket --key bar.txt --duration 3600 --profile default
```

- Currently, You can provide duration only in seconds.
- ``--profile`` option is the value for ~/.aws/credentials. You should write your credentials in the file. ref: http://blogs.aws.amazon.com/security/post/Tx3D6U6WSFGOK2H/A-New-and-Standardized-Way-to-Manage-Credentials-in-the-AWS-SDKs

## TODO

- Support another credential provider
- ``--expires`` option. It might contain time in a word (e.g. '1h' or '30min')

## Contributing

1. Fork it ( https://github.com/[my-github-username]/presigner/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
