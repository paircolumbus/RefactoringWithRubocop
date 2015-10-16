# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  def initialize
    @people = { thieves: 5, Officers: 1 }
    @population = 50
  end

  def thieves(thieves_number = @people[:thieves])
    @people[:thieves] = thieves_number
  end

  def officers
    @people[:Officers]
  end

  attr_reader :population

  def officers=(officers)
    @people[:Officers] = officers
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness_vals = []
    happiness = 0
    (1..@population).each do |index|
      happiness_vals.push(rand((100 - successful_crime_rate)..100))
      index + 1
    end
    happiness_vals.each do |value|
      happiness += value
    end
    happiness / 100
  end

  def successful_crime_rate
    thieves = @people[:thieves]
    officers = @people[:Officers]
    if thieves <= 0
      odds_percent = 0
    elsif officers > thieves
      odds_percent = 0
    else
      odds_percent = (1 - officers.to_f / thieves.to_f) * 100
    end
    odds_percent
  end

  def thief_demo
    (@people[:thieves] / @population.to_f * 100).round.to_s << '%'
  end

  def officer_demo
    (@people[:Officers] / @population.to_f * 100).round.to_s << '%'
  end

  def civilian_demo
    civilians = @population - @people[:thieves] - @people[:Officers]
    (civilians / @population.to_f * 100).round.to_s << '%'
  end

  def city_demographics
    { thieves: thief_demo, officers: officer_demo, civilians: civilian_demo }
  end
end
