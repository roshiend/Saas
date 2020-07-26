class Frontend::AccountsController < ApplicationController
	before_action :find_account ,only:[:destroy]
  def new
  	@account = Account.new
  end

  def create
  	@account = Account.new(acc_params)
  	if@account.save
  		redirect_to backend_root_path
  	else
  		render 'new'
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
  		params.require(:account).permit(:subdomain)
  	end

end
