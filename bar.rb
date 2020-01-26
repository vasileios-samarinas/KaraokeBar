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
    if room.availability == true
  room.occupancy = guest
  room.availability = false
    else
  return "Select another room"
    end
end

def check_out_room(room_name)
  room=find_room_from_the_bar(room_name)
  room.availability=true
  room.occupancy = nil
end


def find_room_from_the_bar(name_of_room)
  for room in @rooms
    if room.name==name_of_room
      return room
    end
  end
end


end
