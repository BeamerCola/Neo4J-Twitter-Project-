require_relative 'boot'

require 'rails/all'
require 'neo4j/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AssetPortal
  class Application < Rails::Application
    
    config.generators do |g|
      g.orm             :neo4j
    end

    # Configure where the embedded neo4j database should exist
    # Notice embedded db is only available for JRuby
    # config.neo4j.session_type = :embedded  # default :http
    # config.neo4j.session_path = File.expand_path('neo4j-db', Rails.root)
    config.neo4j.session.type = :http
    config.neo4j.session.path = 'http://localhost:7474'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
