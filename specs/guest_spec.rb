require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest.rb')
require_relative('../room')
require_relative('../bar.rb')

class TestGuest<Minitest::Test

def setup
@guest1=Guest.new("Rita",5,8)
@guest2=Guest.new("Mike",5,20)
@guest3=Guest.new("Calum",8,20)
@room1=Room.new("Poproom",5,10,["Abba-Dancing Queen"])
@entrance_fee=3
end

def test_return_name
assert_equal("Rita",@guest1.name)
end

def test_return_group_of_people
assert_equal(5,@guest1.group_of_people)
end

def test_return_wallet
assert_equal(20,@guest2.wallet)
end

def test_guest_can_afford_room_fee
total_cost=@room1.cost+@entrance_fee
result=@guest2.sufficient_funds?(total_cost)
assert_equal(true,result)
end

end
