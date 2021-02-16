



class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end 
end

class Manager < Employee

  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss)
    @assigned_employees = []
  end

  #add into @assigned_employees the correct employee instance
  def assign_employee(*employee) # set up iteration
    employee.each do |emp|
      @assigned_employees << emp
    end
  end

  def assigned_employees
    @assigned_employees
  end


  def bonus(multiplier)
    bonus = 0
    queue = [self]
    until queue.empty?
      current_employee = queue.shift
        bonus += current_employee.salary if current_employee != self
        if current_employee.is_a?(Manager)
          current_employee.assigned_employees.each do |employee1|
            queue << employee1
          end
        end
    end
    bonus * multiplier
  end

end

Ned = Manager.new('Ned', "founder", 1000000)
Darren = Manager.new('Darren', "TA Manager", 78000, Ned)
Shawna = Employee.new("Shawna", "TA", 12000, Darren)
David = Employee.new("David", "TA", 10000, Darren)
Ned.assign_employee(Darren)
Darren.assign_employee(Shawna, David)
p Ned.bonus(2)
p Darren.bonus(5)

#  def bonus(multiplier)
#    bonus = 0
#      puts self.salary
#      if self.assigned_employees.empty?
#      
#        self.assigned_employees.shift#

#    bonus * multiplier
#  end






