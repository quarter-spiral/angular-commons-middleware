require "angular-commons-middleware/version"

require 'brochure'
require 'coffee-script'
require 'json'

module Angular
  module Commons
    class Middleware
      PATH_PREFIX = /^\/angular-commons\//

      def initialize(app)
        @app = app

        @brochure = Brochure.app(self.class.root)
      end

      def call(env)
        if angular_commons_request?(env)
          serve_angular_asset(env)
        else
          @app.call(env)
        end
      end

      def self.root
        File.expand_path('../angular-commons-middleware', __FILE__)
      end

      protected
      def angular_commons_request?(env)
        env['PATH_INFO'] =~ PATH_PREFIX
      end

      def serve_angular_asset(env)
        brochure_env = env.clone
        brochure_env['PATH_INFO'] = brochure_env['PATH_INFO'].gsub(PATH_PREFIX, '/')
        @brochure.call(brochure_env)
      end
    end
  end
end
