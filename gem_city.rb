# This class represents the town of GemCity
# This is a town riddled with crime, but we can find out how happy the town is
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
    happiness_vals = []
    happiness = 0
    @population.times do
      happiness_vals.push(rand((100 - successful_crime_rate)..100))
    end
    happiness_vals.each do |value|
      happiness += value
    end
    happiness / 100
  end

  def successful_crime_rate
    if thieves <= 0 || officers > thieves
      odds_percent = 0
    else
      odds = 1 - officers.to_f / thieves.to_f
      odds_percent = odds * 100
    end
    odds_percent
  end

  def city_demographics
    demographics = {}
    @people.collect do |type, _number|
      demographics[type] = "#{percent_of_pop(type)}%"
    end
    civilians_pc = 100 - (percent_of_pop(officers) + percent_of_pop(thieves))
    demographics[:civilians] = "#{civilians_pc}%"
    demographics
  end

  def percent_of_pop(type)
    (100 * @people[type] / population.to_f).round
  end
end
