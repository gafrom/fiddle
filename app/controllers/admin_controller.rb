class AdminController < ApplicationController
  before_action :authenticate_user!, :provide_user
  rescue_from CanCan::AccessDenied do
    head :forbidden
  end

  private

  def provide_user
    @user = current_user
  end
end
