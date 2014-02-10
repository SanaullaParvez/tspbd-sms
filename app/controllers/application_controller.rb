class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :country, :user
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  def country
    @country = Country.all
  end
  def user
    @user = current_user || User.new
    if @user.student?
      @student ||= Student.find_all_by_admission_no(current_user.username)
    elsif @user.employee? or @user.admin?
      @employee ||= Employee.find_all_by_employee_number(current_user.username)
    #elsif @user.parent?
    #  @parent ||= Parent.find_all_by_employee_number(current_user.username)
    end

  end
end
