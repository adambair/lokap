# Naming your gems

# http://guides.rubygems.org/name-your-gem/

# USE UNDERSCORES FOR MULTIPLE WORDS
#  If a class or module has multiple words, use underscores to separate them.
#  This matches the file the user will require, making it easier for the user
#  to start using your gem.

# USE DASHES FOR EXTENSIONS
#  If you’re adding functionality to another gem, use a dash. This usually
#  corresponds to a / in the require statement (and therefore your gem’s
#  directory structure) and a :: in the name of your main class or module.

# MIX UNDERSCORES AND DASHES APPROPRIATELY
#  If your class or module has multiple words and you’re also adding
#  functionality to another gem, follow both of the rules above. For example,
#  net-http-digest_auth adds HTTP digest authentication to net/http. The user
#  will require 'net/http/digest_auth' to use the extension
#  (in class Net::HTTP::DigestAuth).

# -----

# Start with internal gem
# Extract later

# reversible_id
# reversible_id-rails

cd gems
bundle gem gem_name --no-coc --no-ext --no-mit --test=rspec
# update gemspec
# do your thing

# for internal gems
#  ...in Gemfile
gem 'gem_name', path: 'gems/gem_name'

