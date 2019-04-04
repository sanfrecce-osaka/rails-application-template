git :init
source_paths.unshift(File.dirname(__FILE__))
copy_file 'gitignore', '.gitignore', force: true
remove_file 'Gemfile'
copy_file 'Gemfile', 'Gemfile'
run 'bundle install --path vendor/bundle'

# rspec
generate 'rspec:install'
copy_file 'spec/rails_helper.rb', 'spec/rails_helper.rb', force: true
copy_file 'rspec', '.rspec', force: true
copy_file 'bin/rspec-queue', 'bin/rspec-queue'

# webpacker
run 'bundle exec rails webpacker:install'

# bootstrap
run 'yarn add bootstrap'
copy_file 'app/javascript/packs/application.js', 'app/javascript/packs/application.js', force: true
copy_file 'app/javascript/src/application.scss', 'app/javascript/src/application.scss', force: true
remove_file 'app/views/layouts/application.html.erb'
copy_file 'app/views/layouts/application.html.haml', 'app/views/layouts/application.html.haml'
run 'yarn add jquery'
run 'yarn add popper.js'
copy_file 'config/webpack/environment.js', 'config/webpack/environment.js', force: true

# config
generate 'config:install'
copy_file 'config/settings/production.yml', 'config/settings/production.yml', force: true
copy_file 'config/settings.local.yml', 'config/settings.local.yml', force: true

# guard-livereload
copy_file 'Guardfile', 'Guardfile'

# spring
run 'bin/spring stop'
run 'spring binstub --all'

# bullet
copy_file 'config/environments/development.rb', 'config/environments/development.rb', force: true
copy_file 'config/environments/production.rb', 'config/environments/production.rb', force: true

# pry-rc
copy_file 'pryrc', '.pryrc'

# rubocop
copy_file 'rubocop.yml', '.rubocop.yml', force: true
copy_file 'lib/tasks/add_frozen_string_literal.rake', 'lib/tasks/add_frozen_string_literal.rake'
rake 'rubocop:add_frozen_string_literal'

git add: '.'
git commit: "-a -m 'Initial commit'"