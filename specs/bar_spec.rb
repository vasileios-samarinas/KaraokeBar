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
  @bar1=Bar.new("Karaoke Paradise",100,[@room1,@room2,@room3])
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


end
