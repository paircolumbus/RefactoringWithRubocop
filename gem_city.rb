# This class represents the town of GemCity
# This is a town riddled with crime, but we can find out how happy the town is
class GemCity
  attr_reader :population
  attr_accessor :thieves, :officers, :civilians
  def initialize
    @thieves = 5
    @officers = 1
    @population = 50
  end

  def civilians
    population - (officers + thieves)
  end

  def happiness_of_town
    overall_happiness = 0
    @population.times do
      overall_happiness += individual_happiness
    end
    overall_happiness / 100
  end

  def individual_happiness
    # happiness is random... people don't know what they want!
    rand((100 - successful_crime_rate)..100)
  end

  def successful_crime_rate
    if officers > thieves || thieves <= 0
      0
    else
      (1 - officers / thieves.to_f) * 100
    end
  end

  def city_demographics
    {  officers:   "#{ percent_of_pop (officers)  }%",
       thieves:    "#{ percent_of_pop (thieves)   }%",
       civilians:  "#{ percent_of_pop (civilians) }%" }
  end

  def percent_of_pop(type)
    (100 * type / population.to_f).round
  end
end
