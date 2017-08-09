class ChargesController < ApplicationController
    
    def create
        # Creates a Stripe Customer object, for associating
        # with the charge
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
     
        # Where the real magic happens
        charge = Stripe::Charge.create(
            customer: customer.id, # Note -- this is NOT the user_id in your app
            amount: Amount.default,
            description: "BigMoney Membership - #{current_user.email}",
            currency: 'usd'
        )
        
        current_user.premium!
     
        flash[:notice] = "Thanks, #{current_user.email}! Your account now has a premium subscription."
        redirect_to root_path # or wherever
     
        # Stripe will send back CardErrors, with friendly messages
        # when something goes wrong.
        # This `rescue block` catches and displays those errors.
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
            

    end
    
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "BigMoney Membership - #{current_user.email}",
            amount: Amount.default
        }
    end
    
    def downgrade
        if current_user.standard!
            current_user.wikis.update_all(private: false)
            flash[:notice] = "Your account was downgraded successfully."
            redirect_to root_path
        end
    end

end
