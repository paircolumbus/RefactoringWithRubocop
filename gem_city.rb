# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  attr_reader :population

  def initialize
    @people = {
      thieves: 5,
      officers: 1
    }
    @population = 50
  end

  def thieves(thieves_number = @people[:thieves])
    @people[:thieves] = thieves_number
  end

  def officers
    @people[:officers]
  end

  def num_officers(officers)
    @people[:officers] = officers
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness_vals = []
    happiness = 0
    index = 0

    until index >= @population
      happiness_vals.push(rand((100 - successful_crime_rate)..100))
      index += 1
    end

    happiness_vals.each { |value| happiness += value }

    happiness / 100
  end

  def successful_crime_rate
    thieves = @people[:thieves]
    officers = @people[:officers]

    if thieves <= 0 || officers > thieves
      odds_percent = 0
    else
      odds = 1 - officers.to_f / thieves.to_f
      odds_percent = odds * 100
    end

    odds_percent
  end
end
