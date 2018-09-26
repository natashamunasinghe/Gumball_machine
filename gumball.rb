##GUMBALL MACHINE##

#model
#check if gumballs are available
#keep track of number of gumballs
#accept gumball refills

#view
#inform user of result
#prompt for user input
#provide gumballs

#controller
#process user input



####GUMBALL######

class Gumball
end

class GumballMachineModel

#this establishes number of gumballs from the outset. Default is 0.
  def initialize(gumballCount: 0)
    @gumballCount = gumballCount #this argument (gumballCount) was declared as it was used in the argument above
  end
  
#this method will dispense gumballs if there are 1 or more gumballs. This method also decreases by 1 to signify that an user will always get 1 gumball
  def dispense 
    if @gumballCount > 0 #if gumball count is more than 0
       @gumballCount -= 1 #then reduce gumball count by 1 (as the user will get this gumball)
       
      return Gumball.new #this is the number of gumballs leftover after 1 has been deducted
    else
      return nil #this returns as nil if the gumball count is 0
    end
  end

  def refill(nat) 
    @gumballCount += nat #this method  
  end

end

class GumballMachineView

  def greeting
    puts "Welcome to Gumball Madness"
  end

  def menu
    choice = nil
    while choice != "G" && choice != "R" && choice != "X"
      puts "Press G to get a gumball, R to refill, or X to exit"
      choice = gets.chomp.upcase
    end
    
    choice
  end

  def getGumball 
    puts "Yum, here's your gumball"
  end

  def machineEmpty
    puts "We are all gumballed out! Go grab a drink"
  end

  def refill(nat)
    puts "You have #{nat} many gumballs left" #This interpolation shows how many gumballs are left

  end

  def exit
    puts "Have a great day"
  end

end

class GumballMachineController

  def initialize
    @gumballMachineModel = GumballMachineModel.new
    @gumballMachineView = GumballMachineView.new
  end

  def run
    @gumballMachineView.greeting
    choice = @gumballMachineView.menu 
    
    while choice != "X"
      if choice == "G"
        gumball = @gumballMachineModel.dispense
        if gumball.nil?
          @gumballMachineView.machineEmpty
        else
            @gumballMachineView.getGumball
        end
      end
      if choice == "R"
        nat = @gumballMachineModel.refill(6)
        @gumballMachineView.refill(nat) 
      end
      choice = @gumballMachineView.menu
    end
    @gumballMachineView.exit
     end
end

gumballMachineController = GumballMachineController.new
gumballMachineController.run