class EmployeeDepartmentsController < ApplicationController
  # GET /employee_departments
  # GET /employee_departments.json
  def index
    @employee_departments = EmployeeDepartment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_departments }
    end
  end

  # GET /employee_departments/1
  # GET /employee_departments/1.json
  def show
    @employee_department = EmployeeDepartment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_department }
    end
  end

  # GET /employee_departments/new
  # GET /employee_departments/new.json
  def new
    @employee_department = EmployeeDepartment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_department }
    end
  end

  # GET /employee_departments/1/edit
  def edit
    @employee_department = EmployeeDepartment.find(params[:id])
  end

  # POST /employee_departments
  # POST /employee_departments.json
  def create
    @employee_department = EmployeeDepartment.new(params[:employee_department])

    respond_to do |format|
      if @employee_department.save
        format.html { redirect_to @employee_department, notice: 'Employee department was successfully created.' }
        format.json { render json: @employee_department, status: :created, location: @employee_department }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_departments/1
  # PUT /employee_departments/1.json
  def update
    @employee_department = EmployeeDepartment.find(params[:id])

    respond_to do |format|
      if @employee_department.update_attributes(params[:employee_department])
        format.html { redirect_to @employee_department, notice: 'Employee department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_departments/1
  # DELETE /employee_departments/1.json
  def destroy
    @employee_department = EmployeeDepartment.find(params[:id])
    @employee_department.destroy

    respond_to do |format|
      format.html { redirect_to employee_departments_url }
      format.json { head :no_content }
    end
  end
end
