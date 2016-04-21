
# gems
gem 'annotate'
gem 'coffee-script-source', version: '1.8.0'
gem 'font-awesome-sass'
gem 'font-awesome-rails'

gem_group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
end

if yes?('Would you like install "bootstrap"? (y or n):')
  gem 'therubyracer'
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'
  
  after_bundle do
    puts '  -----------------------------------------------------------------------'
    puts '    Please run "rails g bootstrap:install less" after "bundle install".'
    puts '  -----------------------------------------------------------------------'
  end
  if yes?('Would you like install "honoka-rails"? (y or n):')
    gem 'honoka-rails', version: '>= 3.3.6.3'
    
    after_bundle do
      puts '  -----------------------------------------------------------------------'
      puts '    Please rename "application.css" to "application.css.scss",'
      puts '    and add "@import "honoka";" to "application.css.scss".'
      puts '  -----------------------------------------------------------------------'
    end
  end
end

# bundler config
file '.bundle/config', <<-BUNDLE_CONFIG
---
BUNDLE_PATH: vendor/bundle
BUNDLE_DISABLE_SHARED_GEMS: '1'
BUNDLE_CONFIG
