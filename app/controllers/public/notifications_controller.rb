class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_end_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

end