# This class represents the town of Gem_City
class GemCity
  # This is a town riddled with crime but we can find out how happy the town is
  attr_accessor :population, :thieves, :officers
  def initialize
    @thieves = 5
    @officers = 1
    @population = 50
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness_vals = []
    happiness = 0
    (1..@population).each do
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
    civilians = population - (thieves + officers)
    demographics =
    {
      thieves: (get_percentage(thieves)) + '%',
      officers: (get_percentage(officers)) + '%',
      civilians: (get_percentage(civilians)) + '%'
    }
    demographics
  end

  def get_percentage(num)
    num = ((num.to_f / population.to_f) * 100.0).to_i
    num.to_s
  end
end
