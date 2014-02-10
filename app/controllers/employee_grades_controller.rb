class EmployeeGradesController < ApplicationController
  # GET /employee_grades
  # GET /employee_grades.json
  def index
    @employee_grades = EmployeeGrade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_grades }
    end
  end

  # GET /employee_grades/1
  # GET /employee_grades/1.json
  def show
    @employee_grade = EmployeeGrade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_grade }
    end
  end

  # GET /employee_grades/new
  # GET /employee_grades/new.json
  def new
    @employee_grade = EmployeeGrade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_grade }
    end
  end

  # GET /employee_grades/1/edit
  def edit
    @employee_grade = EmployeeGrade.find(params[:id])
  end

  # POST /employee_grades
  # POST /employee_grades.json
  def create
    @employee_grade = EmployeeGrade.new(params[:employee_grade])

    respond_to do |format|
      if @employee_grade.save
        format.html { redirect_to @employee_grade, notice: 'Employee grade was successfully created.' }
        format.json { render json: @employee_grade, status: :created, location: @employee_grade }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_grades/1
  # PUT /employee_grades/1.json
  def update
    @employee_grade = EmployeeGrade.find(params[:id])

    respond_to do |format|
      if @employee_grade.update_attributes(params[:employee_grade])
        format.html { redirect_to @employee_grade, notice: 'Employee grade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_grades/1
  # DELETE /employee_grades/1.json
  def destroy
    @employee_grade = EmployeeGrade.find(params[:id])
    @employee_grade.destroy

    respond_to do |format|
      format.html { redirect_to employee_grades_url }
      format.json { head :no_content }
    end
  end
end
