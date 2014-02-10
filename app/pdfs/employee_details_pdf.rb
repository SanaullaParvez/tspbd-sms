class EmployeeDetailsPdf < Prawn::Document
  def initialize(employee, view)
    super(top_margin: 70)
    @employee = employee
    @view = view
    page_header
    employee_table
  end

  def page_header
    text "Order \##{@employee.full_name}", size: 30, style: :bold
  end

  def each_records
    move_down 20
    table employee_table do
      row(0).font_style = :bold
      columns(1..3).align = :right
      #columns(1..3).font_color = "548ab2"
      self.row_colors = ["eff3fe", "dae6ff"]
      self.header = true
    end
  end

  def employee_table
    #[["Admission Number",@employee.employee_number], ["Admission Date",@employee.joining_date], ["Batch",@employee.],
    #["Course",@employee], ["Date of Birth",@employee], ["Blood Group", "Course",@employee],
    #["Gender",@employee], ["Nationality",@employee], ["Language",@employee],
    #["Category",@employee], ["Religion",@employee], ["Address",@employee],
    #["City",@employee], ["State",@employee], ["PIN code",@employee],
    #["Country",@employee], ["Phone",@employee], ["Mobile",@employee],
    #["Email",@employee], ["Group tutor",@employee], ["Immediate contact",@employee]]
    [["Admission Number",@employee.employee_number], ["Joining Date",@employee.joining_date], ["Department",@employee.department.name],
    ["Category",@employee.category.name], ["Position",@employee.position.name], ["Job Title",@employee.job_title],
    ["Manager",@employee.reporting_manager_id], ["Gender",@employee.gender], ["Status",@employee.status],
    ["Qualification",@employee.qualification], ["Total Experience",@employee.experience_detail], ["Experience Info",@employee.experience_detail]]

        #@employee.each_records.map do |employee|
        #  ['Admission Number',employee.employee_number,'Admission Date',employee]
        #end
  end
  #
  #def price(num)
  #  @view.number_to_currency(num)
  #end

  def total_price
    move_down 15
    text "Total Price: #{price(@employee.total_price)}", size: 16, style: :bold
  end
end