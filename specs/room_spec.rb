require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

def setup
@song1=Song.new("Metallica-Fuel")
@song2=Song.new("Abba-Dancing Queen")
@song3=Song.new("Britney Spears-Crazy")
@song4=Song.new("Aerosmith-Jaded")
@room1=Room.new("Poproom",5,10,["Abba-Dancing Queen"])
@room2=Room.new("Metalroom",6,12,["Metallica-Fuel"])
@room3=Room.new("Danceroom",4,15,["Britney Spears-Crazy"])
@song_titles=[@song1,@song2,@song3,@song4]
end

def test_return_name
assert_equal("Poproom",@room1.name)
end

def test_return_room_size
assert_equal(5,@room1.size)
end

def test_return_room_cost
assert_equal(10,@room1.cost)
end


end
