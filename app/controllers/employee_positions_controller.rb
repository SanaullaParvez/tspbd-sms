class EmployeePositionsController < ApplicationController
  # GET /employee_positions
  # GET /employee_positions.json
  def index
    @employee_positions = EmployeePosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_positions }
    end
  end

  # GET /employee_positions/1
  # GET /employee_positions/1.json
  def show
    @employee_position = EmployeePosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_position }
    end
  end

  # GET /employee_positions/new
  # GET /employee_positions/new.json
  def new
    @employee_position = EmployeePosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_position }
    end
  end

  # GET /employee_positions/1/edit
  def edit
    @employee_position = EmployeePosition.find(params[:id])
  end

  # POST /employee_positions
  # POST /employee_positions.json
  def create
    @employee_position = EmployeePosition.new(params[:employee_position])

    respond_to do |format|
      if @employee_position.save
        format.html { redirect_to @employee_position, notice: 'Employee position was successfully created.' }
        format.json { render json: @employee_position, status: :created, location: @employee_position }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_positions/1
  # PUT /employee_positions/1.json
  def update
    @employee_position = EmployeePosition.find(params[:id])

    respond_to do |format|
      if @employee_position.update_attributes(params[:employee_position])
        format.html { redirect_to @employee_position, notice: 'Employee position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_positions/1
  # DELETE /employee_positions/1.json
  def destroy
    @employee_position = EmployeePosition.find(params[:id])
    @employee_position.destroy

    respond_to do |format|
      format.html { redirect_to employee_positions_url }
      format.json { head :no_content }
    end
  end
end
