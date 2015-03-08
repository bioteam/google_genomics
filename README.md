# GoogleGenomics

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/google_genomics`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_genomics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_genomics

## Standalone Client:

### Configuration setup:

  https://developers.google.com/bigquery/docs/authorization

  Configure GoogleGenomics client:

```ruby
GoogleGenomics::Config.setup do |config|
  config.pass_phrase = "notasecret"
  config.key_file    = /location/to_your/key_file.p12
  config.scope       = "https://www.googleapis.com/auth/genomics.readonly"
  config.email       = "XXXXXX@developer.gserviceaccount.com"
  config.retries     = 1
end
```

retries indicates the number of times to retry on recoverable errors (no retries if set to one or not present)

  And authorize client:

```ruby
@auth = GoogleGenomics::Auth.new
@auth.authorize
GoogleGenomics::Dataset.all
```
  Then you are ready to go!

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/google_genomics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
