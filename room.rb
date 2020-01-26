class Room

attr_accessor :name,:size,:cost,:availability,:occupancy,:songs

def initialize(name,size,cost,songs)
  @name = name
  @size = size
  @cost = cost
  @availability= true
  @occupancy= nil
  @songs=songs
end


def songs_count
  return @songs.size()
end

def add_song(song)
  @songs.push(song)
end

end
