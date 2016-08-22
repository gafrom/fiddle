class Admin::CatalogController < AdminController
  rescue_from ActionController::ParameterMissing do  
    flash[:notice] = t '.file_missing'
    redirect_back(fallback_location: root_path)
  end

  def new
  end

  def create
    if Product.load catalog_params[:file]
      redirect_to root_path
    else
      flash[:error] = t '.load_error'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def catalog_params
    params.require(:catalog).permit(:file)
  end
end
