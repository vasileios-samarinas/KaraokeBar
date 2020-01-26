class Bar

attr_accessor :name,:till,:rooms

def initialize(name,till,rooms)
  @name = name
  @till= till
  @rooms=rooms
end


def find_room_from_the_bar(name_of_room)
      for room in @rooms
        if room.name==name_of_room
          return room
        end
      end
end




end
