class Admin::CatalogController < AdminController
  def new
  end

  def create
    if catalog_params[:file].blank?
      return redirect_back(fallback_location: root_path)
    end

    Product.load catalog_params[:file]
    redirect_to root_path
  end

  private

  def catalog_params
    params.require(:catalog).permit(:file)
  end
end
