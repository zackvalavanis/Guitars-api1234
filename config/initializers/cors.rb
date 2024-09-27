# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'  # This allows requests from any origin. Replace '*' with specific domains to restrict access.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization'],  # Add headers you want to expose to the client (e.g., Authorization tokens)
      max_age: 600
  end
end
