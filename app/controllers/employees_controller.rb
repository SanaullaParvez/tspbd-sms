class EmployeesController < ApplicationController

  load_and_authorize_resource
  before_filter :add_category, :add_position, :add_department, :add_grade, :nationalities, :my_config

  def add_category
    @categories = EmployeeCategory.find(:all,:order => "name asc",:conditions=>'status = 1')
    end
  def add_position
    @positions = EmployeePosition.find(:all,:order => "name asc",:conditions=>'status = 1')
  end
  def add_department
    @departments = EmployeeDepartment.find(:all,:order => "name asc",:conditions=>'status = 1')
  end
  def add_grade
    @grades = EmployeeGrade.find(:all,:order => "name asc",:conditions=>'status = 1')
  end
  def nationalities
    @nationalities = Country.find(:all)
  end
  def my_config
    @my_config = MyConfiguration.find_by_config_key('EmployeeNumberAutoIncrement')
  end


  def index
    @employees = Employee.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @gender = "Male"
    @gender = "Female" if @employee.gender == false
    @status = "Active"
    @status = "Inactive" if @employee.status == false
    @reporting_manager = Employee.find(@employee.reporting_manager_id).full_name unless @employee.reporting_manager_id.nil?
    exp_years = @employee.experience_year
    exp_months = @employee.experience_month
    date = Date.today
    total_current_exp_days = (date-@employee.joining_date).to_i
    current_years = (total_current_exp_days/365)
    rem = total_current_exp_days%365
    current_months = rem/30
    #year = exp_years+current_years unless exp_years.nil?
    #month = exp_months+current_months unless exp_months.nil?
    total_month = (exp_months || 0)+current_months
    year = total_month/12
    month = total_month%12
    @total_years = (exp_years || 0)+current_years+year
    @total_months = month
    GoogleChart::PieChart.new('320x200', "Pie Chart",false) do |pc|
      pc.data "Apples", 40
      pc.data "Banana", 20
      pc.data "Peach", 30
      pc.data "Orange", 60
      puts "\nPie Chart"
      @line_graphs = pc.to_url
      #raise @line_graphs
    end

    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        render :pdf => "profile_#{@employee.employee_number}"
        #pdf = EmployeeDetailsPdf.new(@employee, view_context)
        #send_data @employee, filename: "profile_#{@employee.employee_number}.pdf",
        #          type: "application/pdf",
        #          disposition: "inline"
      end
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new
    @selected_value = MyConfiguration.default_country
    @last_admitted_employee = Employee.find(:last,:conditions=>"employee_number != 'admin'")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    #User.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    #raise Employee.create_user_and_validate.inspect
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    #raise params.inspect
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end
end
