# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  attr_reader :population
  def initialize
    @people = {
      thieves: 5,
      officers: 1 }
    @population = 50
  end

  def thieves(thieves_number = @people[:thieves])
    @people[:thieves] = thieves_number
  end

  def officers(officers_number = @people[:officers])
    @people[:officers] = officers_number
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness_vals = (1..@population).collect do
      rand((100 - successful_crime_rate)..100)
    end
    happiness = happiness_vals.reduce(0, :+)
    happiness / 100
  end

  def successful_crime_rate
    thieves = @people[:thieves]
    officers = @people[:officers]
    if thieves <= 0 || officers > thieves
      0
    else
      (1 - officers.to_f / thieves.to_f) * 100
    end
  end

  def percentage_of_population(group)
    format('%.0f%', (group.to_f / @population.to_f) * 100.0)
  end

  def city_demographics
    civilians = @population - @people[:thieves] - @people[:officers]

    { thieves: percentage_of_population(@people[:thieves]),
      officers: percentage_of_population(@people[:officers]),
      civilians: percentage_of_population(civilians) }
  end
end
