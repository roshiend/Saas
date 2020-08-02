class Frontend::AccountsController < ApplicationController
	before_action :find_account ,only:[:destroy]
  def new
  	@account = Account.new
  	@account.build_owner
  end

  def create
  	@account = Account.new(acc_params)
     
    # if@account.valid?
    #   Apartment::Tenant.create(@account.subdomain)
    #   Apartment::Tenant.switch(@account.subdomain)
  	  if@account.save
  		redirect_to new_user_session_url(subdomain: @account.subdomain)
  	else
     redirect_to new_account_url
     flash[:alert] = @account.errors.full_messages.to_sentence
      
     

  		
  	end
  end

  def destroy
  	if @account.destroy
  		redirect_to root_path
  	end
  end

  private
  	def find_account
  		@account = Account.find(params[:id])
  	end

  	def acc_params
  		params.require(:account).permit(:subdomain,owner_attributes:[:name,:email,:password,:password_confirmation])
  	end

end
