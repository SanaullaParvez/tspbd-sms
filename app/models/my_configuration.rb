class MyConfiguration < ActiveRecord::Base
  attr_accessible :config_key, :config_value


  GRADINGTYPES = {"1"=>"GPA","2"=>"CWA","3"=>"CCE"}


  class << self

    def get_config_value(key)
      c = find_by_config_key(key)
      c.nil? ? nil : c.config_value
    end

    def default_country
      default_country_value = self.find_by_config_key('DefaultCountry').config_value.to_i
      return default_country_value
    end

    def get_multiple_configs_as_hash(keys)
      conf_hash = {}
      keys.each { |k| conf_hash[k.underscore.to_sym] = get_config_value(k) }
      conf_hash
    end

    def get_grading_types
      grading_types = GRADINGTYPES
      types= all(:conditions=>{:config_key=>grading_types.values, :config_value=>"1"},:group=>:config_key)
      grading_types.keys.select{|k| types.collect(&:config_key).include? grading_types[k]}
    end
    def available_modules
      modules = find_all_by_config_key('AvailableModules')
      modules.map(&:config_value)
    end
    def set_config_values(values_hash)
      values_hash.each_pair { |key, value| set_value(key.to_s.camelize, value) }
    end

    def set_value(key, value)
      config = find_by_config_key(key)
      config.nil? ?
          MyConfiguration.create(:config_key => key, :config_value => value) :
          config.update_attribute(:config_value, value)
    end

  end

end
