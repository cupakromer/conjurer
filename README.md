# Conjurer

Simple plug-in for RSpec that allows for explicit pre-loading of `let`.

This allows for the general elimination of `let!` while providing a more
semantic alternative. See my post [The Bang is for Surprise](http://aaronkromer.com/blog/2013-05-19-the-bang-is-for-surprise.html)
for more details.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'conjurer'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conjurer

## Usage

If using Rails, the gem should automatically be loaded. Otherwise, just add the
following to your `spec_helper`:

```ruby
require 'conjurer'
```

You can also use [`Bundler.setup`](http://gembundler.com/v1.3/bundler_setup.html)
for any other auto loading.

You can use the `preload` or more mystical `conjur` methods in your RSpec
example groups. These methods are simply aliases of each other:

```ruby
describe "Loading barewords" do

  context "preloading works with `let`" do
    subject(:array) { [1, 2, 3] }
    let(:popped) { array.pop }

    conjur :popped

    it { expect(array).to eq [1, 2] }

    it { expect(popped).to eq 3 }
  end

  context "preloading works on methods" do
    subject(:array) { [] }

    def some_data
      array << [1, 2]
    end

    preload :some_data

    it { expect(array).to eq [1, 2] }
  end

end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
