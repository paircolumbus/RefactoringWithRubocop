# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  attr_reader :population
  def initialize
    @people = {
      thieves:  5,
      Officers: 1
    }
    @population = 50
  end

  def thieves
    @people[:thieves]
  end

  def thieves=(thieves_number)
    @people[:thieves] = thieves_number
  end

  def officers
    @people[:Officers]
  end

  def officers=(officers)
    @people[:Officers] = officers
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
    thieves = @people[:thieves]
    officers = @people[:Officers]
    odds_percent = 0
    if thieves > 0 && officers <= thieves
      odds = 1 - officers.to_f / thieves.to_f
      odds_percent = odds * 100
    end
    odds_percent
  end

  def city_demographics
    civilians = population - (thieves + officers)
    { thieves:   "#{population_percentage thieves}%",
      officers:  "#{population_percentage officers}%",
      civilians: "#{population_percentage civilians}%"
    }
  end

  private

  def population_percentage(number)
    ((number.to_f / population.to_f) * 100).to_i
  end
end
