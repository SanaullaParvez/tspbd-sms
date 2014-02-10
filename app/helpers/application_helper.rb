module ApplicationHelper
  def current_school_detail
    SchoolDetail.first||SchoolDetail.new
  end
  def available_language_options
    options = []
    AVAILABLE_LANGUAGES.each do |locale, language|
      options << [language, locale]
    end
    options.sort_by { |o| o[0] }
  end
  def current_school_name
    Rails.cache.fetch("current_school_name#{session[:user_id]}"){
      MyConfiguration.get_config_value('InstitutionName')
    }
  end
end
