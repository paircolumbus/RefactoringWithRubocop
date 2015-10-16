# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  def initialize
    @people = { thieves: 5, Officers: 1 }
    @population = 50
  end

  def thieves(thieves_number = @people[:thieves])
    @people[:thieves] = thieves_number
  end

  def officers
    @people[:Officers]
  end

  attr_reader :population

  def officers=(officers)
    @people[:Officers] = officers
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness = 0
    (1..@population).each do
      happiness += (rand((100 - successful_crime_rate)..100))
    end
    happiness / 100
  end

  def successful_crime_rate
    if @people[:thieves] <= 0 || @people[:Officers] > @people[:thieves]
      0
    else
      (1 - @people[:Officers].to_f / @people[:thieves].to_f) * 100
    end
  end

  def compute_demo(count)
    (count / @population.to_f * 100).round.to_s << '%'
  end

  def city_demographics
    thieves = compute_demo(@people[:thieves])
    officers = compute_demo(@people[:Officers])
    civs = compute_demo(@population - @people[:thieves] - @people[:Officers])
    { thieves: thieves, officers: officers, civilians: civs }
  end
end
