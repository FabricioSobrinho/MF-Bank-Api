Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://mf-bank.vercel.app/"

    resource "*",
      headers: :any,
             expose: %w[access-token expiry token-type uid client],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
