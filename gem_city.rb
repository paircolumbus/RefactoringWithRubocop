# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  attr_accessor :thieves, :officers
  attr_reader :population

  def initialize
    @thieves = 5
    @officers = 1
    @population = 50
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
    if @thieves <= 0 || @officers > @thieves
      0
    else
      (1 - @officers.to_f / @thieves.to_f) * 100
    end
  end

  def compute_demo(count)
    (count / @population.to_f * 100).round.to_s << '%'
  end

  def city_demographics
    thieves = compute_demo(@thieves)
    officers = compute_demo(@officers)
    civs = compute_demo(@population - @thieves - @officers)
    { thieves: thieves, officers: officers, civilians: civs }
  end
end
