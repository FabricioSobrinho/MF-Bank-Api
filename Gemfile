source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'
gem 'rails', '~> 7.0.8'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'

gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

gem 'bootsnap', require: false

gem 'rack-cors'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'letter_opener', '~> 1.8'
  gem 'solargraph'
end

gem 'devise_token_auth', '~> 1.2'

gem 'active_model_serializers', '~> 0.10.13'
