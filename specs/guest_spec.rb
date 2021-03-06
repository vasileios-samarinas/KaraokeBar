require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest.rb')
require_relative('../room')
require_relative('../bar.rb')

class TestGuest<Minitest::Test

def setup
@guest1=Guest.new("Rita",5,7)
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

def test_guest_can_afford_room_fee__true
  total_cost=@room1.cost+@entrance_fee
  result=@guest2.sufficient_funds?(total_cost)
  assert_equal(true,result)
end

def test_guest_can_afford_room_fee__false
  total_cost=@room1.cost+@entrance_fee
  result=@guest1.sufficient_funds?(total_cost)
  assert_equal(false,result)
end

def test_guest_gets_room_decrease_wallet
total_cost= @room1.cost + @entrance_fee
@guest2.pay_room(total_cost)
assert_equal(7,@guest2.wallet)
end


end
