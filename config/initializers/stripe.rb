Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
}

if Rails.env.production?
    Stripe.api_key = Rails.configuration.stripe[:secret_key]
else 
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
end