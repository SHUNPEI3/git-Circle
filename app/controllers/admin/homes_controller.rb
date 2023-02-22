class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @end_users = EndUser.all.order(id: "DESC").page(params[:page]).per(20)
  end
end
