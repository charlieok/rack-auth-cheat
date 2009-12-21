module Rack
  module Auth
    class Cheat
      # Creates a new Rack::Auth::Cheat object. The +user_field+ and +password_field+
      # are the params looked for in the call method. The defaults are 'username'
      # and 'password', respectively.
      #
      def initialize(app, user_field = 'username', password_field = 'password')
        @app = app
        @user_field = user_field
        @password_field = password_field
      end

      # The call method we've defined first checks to see if the AUTH_USER
      # environment variable is set. If it is, we assume that the user has
      # already been authenticated and move on.
      #
      # If AUTH_USER is not set, and AUTH_FAIL is not set, we then check whether
      # the username and password match (the "Cheat" authentication method). If
      # they match, AUTH_USER is set to the username.
      #
      # If they don't match then the request is passed on without modification.
      # AUTH_FAIL will not be set by this class.
      #
      # It up to the application to check for the presence of AUTH_USER and/or
      # AUTH_FAIL and act as necessary.
      #
      def call(env)
        request = Rack::Request.new(env)

        user = request.params[@user_field]
        password = request.params[@password_field]

        # Only authenticate user if both the username and password fields are present
        unless user && password
          return @app.call(env)
        end

        # Do not authenticate if either one of these is set
        if env['AUTH_USER'] || env['AUTH_FAIL']
          return @app.call(env)
        end

        if user == password
          env['AUTH_USER'] = user
          env['AUTH_TYPE'] = "Cheat"
          env['AUTH_TYPE_USER'] = user
          env['AUTH_TYPE_THIS_REQUEST'] = "Cheat"
          env['AUTH_DATETIME'] = Time.now.utc
          
          env.delete('AUTH_FAIL')
        end

        @app.call(env)
      end
    end
  end
end
