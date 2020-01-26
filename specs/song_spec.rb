require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

def setup
@song1=Song.new("Metallica-Fuel")
@song2=Song.new("Abba-Dancing Queen")
@song3=Song.new("Britney Spears-Crazy")
@song4=Song.new("Aerosmith-Jaded")
end

def test_return_name
assert_equal("Metallica-Fuel",@song1.name)
end


end
