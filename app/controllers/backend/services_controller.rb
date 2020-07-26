class Backend::ServicesController < Backend::BaseController
   before_action :set_service , except:[:create,:index,:new]
  before_action :get_breadcumb_path
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
    add_breadcrumb "New",new_backend_service_path
  end

  def create
     @service = Service.new(service_params)
    if @service.save
      redirect_to new_backend_service_path
      flash[:notice] = "Action Successful"
    else
    render :new
    end 
  end

  def show
     add_breadcrumb "info",backend_service_path
  end

  def edit
    add_breadcrumb "info",backend_service_path
    add_breadcrumb "edit",edit_backend_service_path
  end

  def update
    if @service.update_attributes(service_params)
      redirect_to backend_service_path(@service)
      flash[:notice] = "Update Successful !"
    else
      render :edit
      flash[:alert] = "Try Again"
    end
  end

  def destroy
    if @service.destroy
      redirect_to backend_service_path
      flash[:notice] = "Service deleted"
    end
  end
   private
    def service_params
      params.require(:service).permit(:service_name,:service_price)
    end
    def get_breadcumb_path
      add_breadcrumb "Home", :backend_root_path
      add_breadcrumb "Lead",backend_services_path
    end

    def set_service
      @service = Service.friendly.find(params[:id])
    end
end
