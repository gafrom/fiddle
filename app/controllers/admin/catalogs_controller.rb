class Admin::CatalogsController < AdminController
  def index
    @catalog = Catalog.new
  end
end
