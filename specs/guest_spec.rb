require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest.rb')
require_relative('../room')

class TestGuest<Minitest::Test

def setup
@guest1=Guest.new("Rita",5,8)
@guest2=Guest.new("Mike",5,20)
@guest3=Guest.new("Calum",8,20)
@room1=Room.new("Poproom",5,10,["Abba-Dancing Queen"])

end

def test_return_name
assert_equal("Rita",@guest1.name)
end

def test_return_group_of_people
assert_equal(5,@guest1.group_of_people)
end

def test_return_wallet
assert_equal(8,@guest1.wallet)
end


end
