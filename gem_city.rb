# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  attr_reader :population
  attr_accessor :thieves, :officers

  def initialize
    @thieves = 5
    @officers = 1
    @population = 50
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness_vals = (1..population).collect do
      rand((100 - successful_crime_rate)..100)
    end
    happiness = happiness_vals.reduce(0, :+)
    happiness / 100
  end

  def no_crimes_can_occur?
    thieves <= 0 || officers > thieves
  end

  def crime_probability
    (1 - officers.to_f / thieves.to_f) * 100
  end

  def successful_crime_rate
    no_crimes_can_occur? ? 0 : crime_probability
  end

  def percentage_of_population(group)
    format('%.0f%', (group.to_f / population.to_f) * 100.0)
  end

  def city_demographics
    { thieves: percentage_of_population(thieves),
      officers: percentage_of_population(officers),
      civilians: percentage_of_population(population - thieves - officers) }
  end
end
