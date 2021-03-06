class Guest

attr_accessor :name,:group_of_people,:wallet

def initialize(name,group_of_people,wallet)
  @name = name
  @group_of_people=group_of_people
  @wallet=wallet
end

def sufficient_funds?(total_cost)
  return wallet >= total_cost
end

def pay_room(total_cost)
  if sufficient_funds?(total_cost)
    @wallet -= total_cost
  end
end

end
