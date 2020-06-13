class Backend::LeadsController < Backend::BaseController
  before_action :set_lead , except:[:create,:index,:new]
  before_action :get_breadcumb_path
  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
    add_breadcrumb "New",new_backend_lead_path
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      redirect_to new_backend_lead_path
      flash[:notice] = "Action Successful"
    else
    render :new
    end 
  end
  def show
     add_breadcrumb "info",backend_lead_path
  end

  def edit
    add_breadcrumb "info",backend_lead_path
    add_breadcrumb "edit",edit_backend_lead_path
  end

  def update
    if @lead.update_attributes(lead_params)
      redirect_to backend_lead_path(@lead)
      flash[:notice] = "Update Successful !"
    else
      render :edit
      flash[:alert] = "Try Again"
    end
  end

  def destroy
    if @lead.destroy
      redirect_to backend_lead_path
      flash[:notice] = "Product deleted"
    end
  end
  
  private
    def lead_params
      params.require(:lead).permit(:title,:person_name,:valid_phone_number,:valid_email_address,:current_house_name_or_number,:current_street_name,
        :current_post_code,:new_house_name_or_number,:new_street_name,:new_post_code,:expected_removal_day)
    end
    def get_breadcumb_path
      add_breadcrumb "Home", :backend_root_path
      add_breadcrumb "Lead",backend_leads_path
    end

    def get_product_id
      @lead = Lead.friendly.find(params[:id])
    end
end
