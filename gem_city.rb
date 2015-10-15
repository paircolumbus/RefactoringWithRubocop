# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  attr_reader :population
  attr_accessor :officers, :thieves

  def initialize
    @officers = 1
    @thieves = 5
    @population = 50
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness = 0
    (1..population).each do
      happiness += rand((100 - successful_crime_rate)..100)
    end
    happiness / 100
  end

  def successful_crime_rate
    odds_percent = 0
    if thieves > 0 && officers <= thieves
      odds = 1 - officers.to_f / thieves.to_f
      odds_percent = odds * 100
    end
    odds_percent
  end

  def city_demographics
    thieves_percent = population_percentage thieves
    officers_percent = population_percentage officers
    civilians_percent = 100 - officers_percent - thieves_percent
    { thieves: "#{thieves_percent}%",
      officers: "#{officers_percent}%",
      civilians: "#{civilians_percent}%" }
  end

  def population_percentage(population_group)
    population_group * 100 / population
  end
end
