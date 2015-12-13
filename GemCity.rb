class GemCity
  # This class represents the town of GemCity
  # This is a town riddled with crime but we can find out how happy the town is
  attr_reader :population
  attr_accessor :officers, :thieves

  def initialize
    @thieves = 5
    @officers = 5
    @population = 50
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness_vals = []
    happiness = 0

    @population.times.each do
      happiness_vals << rand((100 - successful_crime_rate)..100)
    end

    happiness_vals.each { |value| happiness += value }
    happiness / 100
  end

  def successful_crime_rate
    if @thieves <= 0 || @officers > @thieves
      0
    else
      100 * (1 - @officers.to_f / @thieves.to_f)
    end
  end
end
