class GemCity
  # This class represents the town of GemCity
  # This is a town riddled with crime but we can find out how happy the town is
  attr_reader :population
  attr_accessor :officers, :thieves

  def initialize
    @thieves = 5
    @officers = 1
    @population = 50
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness = 0
    population.times { happiness += rand((100 - successful_crime_rate)..100) }
    happiness / 100
  end

  def successful_crime_rate
    thieves <= 0 || officers > thieves ? 0 : 100 * (1 - officers / thieves.to_f)
  end

  def city_demographics
    { thieves: demographics_format(thieves),
      officers: demographics_format(officers),
      civilians: demographics_format(population - thieves - officers) }
  end

  def demographics_format(people)
    "#{100 * people / @population}%"
  end
end
