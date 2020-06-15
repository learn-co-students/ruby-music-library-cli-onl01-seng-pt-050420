require 'bundler'
Bundler.require

module Concerns
end

#require_all not native to ruby - requires every file in a directory (gem is called require_all)
require_all 'lib'
