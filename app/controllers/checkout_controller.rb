class CheckoutController < ApplicationController

    
    def create
        product = Product.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            line_items: [{
              price_data: {
                currency: 'usd',
                product_data: {
                  name: product.name,
                },
                unit_amount: product.price,
              },
              quantity: 1,
            }],
            mode: 'payment',
            success_url: root_url,
            cancel_url: root_url,
          })
          respond_to do |format|
            format.js
          end
    end
end