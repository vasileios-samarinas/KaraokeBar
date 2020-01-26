require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar.rb')
require_relative('../room')
require_relative('../guest.rb')

class TestBar<Minitest::Test

def setup
  @room1=Room.new("Poproom",5,10,["Abba-Dancing Queen"])
  @room2=Room.new("Metalroom",6,12,["Metallica-Fuel"])
  @room3=Room.new("Danceroom",4,15,["Britney Spears-Crazy"])
  @guest1=Guest.new("Rita",5,8)
  @guest2=Guest.new("Mike",5,20)
  @bar1=Bar.new("Karaoke Paradise",100,[@room1,@room2,@room3],3)
end

def test_return_name
  assert_equal("Karaoke Paradise",@bar1.name)
end

def test_return_till
  assert_equal(100,@bar1.till)
end

def test_find_room_from_the_bar
  result= @bar1.find_room_from_the_bar("Metalroom")
  assert_equal(@room2,result)
end

def test_check_in_room
  room=@bar1.find_room_from_the_bar("Metalroom")
  @bar1.check_in_room(@guest2,room.name)
  total_cost= @room1.cost + @bar1.entrance_fee
  assert_equal(false,room.availability)
  assert_equal(@guest2,room.occupancy)
  assert_equal(7,@guest2.wallet)
  assert_equal(113,@bar1.till)
end

def test_check_in_room__if_room_not_available
  room=@bar1.find_room_from_the_bar("Metalroom")
  room.availability= false
  result=@bar1.check_in_room(@guest2,room.name)
  assert_equal(false,room.availability)
  assert_equal("Select another room", result)
end

def test_check_out_room
  room=@bar1.find_room_from_the_bar("Metalroom")
  result=@bar1.check_out_room(room.name)
  assert_equal(true,room.availability)
  assert_nil(room.occupancy)
end

def test_entrance_fee
  assert_equal(3,@bar1.entrance_fee)
end

def test_bar_checks_if_customer_cannot_afford_room
  total_cost= @room1.cost + @bar1.entrance_fee
  result=@guest1.sufficient_funds?(total_cost)
  assert_equal(false,result)
end


end
