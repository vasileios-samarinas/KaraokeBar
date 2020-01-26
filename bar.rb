class Bar

attr_accessor :name,:till,:rooms,:entrance_fee

def initialize(name,till,rooms,entrance_fee)
  @name = name
  @till= till
  @rooms=rooms
  @entrance_fee=entrance_fee
end

def check_in_room(guest,room_name)
  room=find_room_from_the_bar(room_name)
  total_cost=@entrance_fee
    if room.availability == true && guest.sufficient_funds?(total_cost) == true
  room.occupancy = guest
  room.availability = false
  guest.pay_room(total_cost)
  receive_payment(total_cost)
    else
  return "Select another room"
    end
end

def check_out_room(room_name)
  room=find_room_from_the_bar(room_name)
  total_cost=room.cost
  if room.occupancy.sufficient_funds?(total_cost) == true
  room.occupancy.pay_room(total_cost)
  receive_payment(total_cost)
  room.availability=true
  room.occupancy = nil
end
end

def find_room_from_the_bar(name_of_room)
  for room in @rooms
    if room.name==name_of_room
      return room
    end
  end
end

def receive_payment(total_cost)
  return @till+=total_cost
  end

end
