class Public::HomesController < ApplicationController
  def top
    @end_user = EndUser.new
  end

  def about
  end
end
