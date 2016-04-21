
# gems
gem 'annotate'
gem 'coffee-script-source', version: '1.8.0'
gem 'font-awesome-sass'

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
elsif yes?('Would you like install "honoka-rails"? (y or n):')
  gem 'honoka-rails', version: '>= 3.3.6.3'
  
  run('mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss')
  append_file 'app/assets/stylesheets/application.scss', <<-APP_SCSS
@import "bootstrap-sprockets";
@import "honoka";
@import "font-awesome-sprockets";
@import "font-awesome";
  APP_SCSS
  
  inject_into_file 'app/assets/javascripts/application.js', before: '//= require_tree .' do
    <<-APP_JS
//= require bootstrap-sprockets
    APP_JS
  end
end

# bundler config
file '.bundle/config', <<-BUNDLE_CONFIG
---
BUNDLE_PATH: vendor/bundle
BUNDLE_DISABLE_SHARED_GEMS: '1'
BUNDLE_CONFIG
