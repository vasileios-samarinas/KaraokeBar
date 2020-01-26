class Guest

attr_accessor :name,:group_of_people,:wallet

def initialize(name,group_of_people,wallet)
  @name = name
  @group_of_people=group_of_people
  @wallet=wallet
end

def sufficient_money?(room)
  return wallet >= room.cost()
end

end
