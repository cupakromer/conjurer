require "conjurer/version"

module Conjurer

  def preload(*names)
    before do
      names.each { |name| __send__ name }
    end
  end
  alias_method :conjur, :preload

end

if defined? RSpec
  RSpec.configure do |c|
    c.extend Conjurer
  end
end
