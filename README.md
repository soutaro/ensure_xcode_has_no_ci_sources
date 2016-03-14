# ensure_xcode_has_no_ci_sources

This is true story.

One day, I added a utility class for JSON parsing, as `UBTypedJsonDictionary`.
My teammate suggested to rename it to `UBTypedJSONDictionary`, since Foundation framework has `NSJSONSerialization` class.
I agreed, and rename the class on Xcode.
And, it broke the build on another teammate's Mac, because his Mac has case sensitive file system.

![Source code not found](https://raw.githubusercontent.com/soutaro/ensure_xcode_has_no_ci_sources/master/xcode.png)

Xcode renamed filename in its project, but does not rename real file.

This command is to find such files: an source code which has differently cased name in file system than Xcode project.
Run this during CI build to make sure your project can build on Mac with case sensitive file system :beer:

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ensure_xcode_has_no_ci_sources'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ensure_xcode_has_no_ci_sources

## Usage

    $ ensure_xcode_has_no_ci_sources YourProject.xcodeproj

![Find out problematic sources](https://raw.githubusercontent.com/soutaro/ensure_xcode_has_no_ci_sources/master/alert.png)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/soutaro/ensure_xcode_has_no_ci_sources.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

