class MyConfigurationsController < ApplicationController

  # GET /my_configurations
  # GET /my_configurations.json
  def index
    @my_configurations = MyConfiguration.all
    @config = MyConfiguration.get_multiple_configs_as_hash ['InstitutionName', 'InstitutionAddress', 'InstitutionPhoneNo', \
        'StudentAttendanceType', 'CurrencyType', 'ExamResultType', 'AdmissionNumberAutoIncrement','EmployeeNumberAutoIncrement', \
        'NetworkState','Locale','FinancialYearStartDate','FinancialYearEndDate','EnableNewsCommentModeration','DefaultCountry','TimeZone']
    @grading_types = MyConfiguration::GRADINGTYPES
    @enabled_grading_types = MyConfiguration.get_grading_types
    @time_zones = TimeZone.all
    @school_detail = SchoolDetail.first || SchoolDetail.new
    @countries=Country.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_configurations }
    end
  end

  # GET /my_configurations/1
  # GET /my_configurations/1.json
  def show
    @my_configuration = MyConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_configuration }
    end
  end

  # GET /my_configurations/new
  # GET /my_configurations/new.json
  def new
    @my_configuration = MyConfiguration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_configuration }
    end
  end

  # GET /my_configurations/1/edit
  def edit
    @my_configuration = MyConfiguration.find(params[:id])
  end

  # POST /my_configurations
  # POST /my_configurations.json
  def create
    MyConfiguration.set_config_values(params[:my_configuration])
    #session[:language] = nil unless session[:language].nil?
    @school_detail = SchoolDetail.first || SchoolDetail.new
    @school_detail.logo = params[:school_detail][:logo] if params[:school_detail].present?
    unless @school_detail.save
      @config = Configuration.get_multiple_configs_as_hash ['InstitutionName', 'InstitutionAddress', 'InstitutionPhoneNo', \
            'StudentAttendanceType', 'CurrencyType', 'ExamResultType', 'AdmissionNumberAutoIncrement','EmployeeNumberAutoIncrement', \
            'NetworkState','Locale','FinancialYearStartDate','FinancialYearEndDate','EnableNewsCommentModeration','DefaultCountry','TimeZone']
      return
    end
    #@current_user.clear_menu_cache
    #Configuration.clear_school_cache(@current_user)
    #News.new.reload_news_bar
    #flash[:notice] = "#{t('flash_msg8')}"
    #redirect_to :action => "settings"  and return

    #@my_configuration = MyConfiguration.new(params[:my_configuration])

    respond_to do |format|
      if @school_detail.save
        flash[:notice] = 'My configuration was successfully created.'
        format.html { redirect_to :action => "index"  and return }
        format.json { render json: @my_configuration, status: :created, location: @my_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @my_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_configurations/1
  # PUT /my_configurations/1.json
  def update
    @my_configuration = MyConfiguration.find(params[:id])

    respond_to do |format|
      if @my_configuration.update_attributes(params[:my_configuration])
        format.html { redirect_to @my_configuration, notice: 'My configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_configurations/1
  # DELETE /my_configurations/1.json
  def destroy
    @my_configuration = MyConfiguration.find(params[:id])
    @my_configuration.destroy

    respond_to do |format|
      format.html { redirect_to my_configurations_url }
      format.json { head :no_content }
    end
  end
end
