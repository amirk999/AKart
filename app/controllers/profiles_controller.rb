class ProfilesController < ApplicationController
  authorize_resource :class => false
  before_filter :check_if_signed_in

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile updated successfully"
    else
      flash[:fail] = "Could not update profile information"
    end
    render 'edit'
  end

  def createwallet
    @profile = current_user.profile
    @currency_type = CurrencyType.find(params[:id])

    wallet = @profile.wallets.where(:currency_type_id => @currency_type.id)

    if wallet.blank?
      begin
        currInst = "::#{@currency_type.name}".constantize.new(@currency_type.rpcuser, 
                                                          @currency_type.rpcpass, 
                                                          @currency_type.rpchost, 
                                                          @currency_type.rpcport)
        account = currInst.create_wallet current_user.id
        @profile.wallets.create(:address => account['address'], 
                                :private_key => account['privkey'], 
                                :currency_type_id => params[:id])
        flash[:success] = "Created wallet successfully"
      rescue => e
        flash[:error] = "Could not generate the wallet. Please contact the administrator"
      end
    else
      flash[:fail] = "Wallet already exists"
    end
    redirect_to profile_path
  end

  private
    def check_if_signed_in
      if !user_signed_in?
        redirect_to root_url, :alert => 'Please log in.'
      end
    end
end
