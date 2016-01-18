# This class represents the town of GemCity
# This is a town riddled with crime but we can find out how happy the town is
class GemCity
  # This class represents the town of GemCity
  attr_reader :population, :city_demographics

  def initialize
    @population = 50
    @people = { thieves: 5, officers: 1 }
  end

  def thieves(thieves_number = @people[:thieves])
    @people[:thieves] = thieves_number
  end

  def officers(officers_number = @people[:officers])
    @people[:officers] = officers_number
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
    officers = @people[:officers]
    if thieves <= 0 || officers > thieves
      odds_percent = 0
    else
      odds = 1 - officers.to_f / thieves.to_f
      odds_percent = odds * 100
    end
    odds_percent
  end

  def city_demographics
    officer_pop_percentage = make_city_demographic('officer')
    theif_pop_percentage = make_city_demographic('thief')
    civ_pop_percentage = make_city_demographic('civilian')
    @city_demographics = { officers: officer_pop_percentage,
                           thieves: theif_pop_percentage,
                           civilians: civ_pop_percentage }
  end

  private

  def make_city_demographic(demographic)
    case demographic

    when 'officer'
      convert_to_percentage((officers.to_f / population) * 100)
    when 'thief'
      convert_to_percentage((thieves.to_f / population) * 100)
    else
      civilians = (population - officers - thieves).to_f
      convert_to_percentage((civilians / population) * 100)
    end
  end

  def convert_to_percentage(float)
    if float % 1 == 0
      float.to_i.to_s + '%'
    else
      float.to_s + '%'
    end
  end
end
