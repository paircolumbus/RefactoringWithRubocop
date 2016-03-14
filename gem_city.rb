class TypeError < StandardError; end

# start GemCity class
class GemCity
  attr_reader :thieves, :officers, :population, :civilians
  # This class represents the town of GemCity
  # This is a town riddled with crime but we can find out how happy the town is

  def initialize
    @thieves = 5
    @officers = 1
    @population = 50
    @civilians = @population - @thieves - @officers
  end

  def thieves=(number)
    fail TypeError, 'Input must be an integer' unless number.is_a? Integer
    @thieves = number
  end

  def officers=(number)
    fail TypeError, 'Input must be an integer' unless number.is_a? Integer
    @officers = number
  end

  def civilians=(number)
    fail TypeError, 'Input must be an integer' unless number.is_a? Integer
    @civilians = number
  end

  def population=(number)
    fail TypeError, 'Input must be an integer' unless number.is_a? Integer
    @population = number
  end

  def demographics
    @demographics = { 'thieves' => rounded_percentage(thieves),
                      'officers' => rounded_percentage(officers),
                      'civilians' => rounded_percentage(civilians) }
  end

  def happiness_of_town
    # happiness is random... people don't know what they want!
    happiness_values = []
    happiness = 0
    counter = 0
    while counter < population
      happiness_values.push(rand((100 - successful_crime_rate)..100))
      counter += 1
    end
    happiness_values.each { |value| happiness += value }
    happiness / 100
  end

  def successful_crime_rate
    thieves <= 0 || officers > thieves ? 0 : odds_percent
  end

  private

  def odds_percent
    (1 - officers.to_f / thieves.to_f) * 100
  end

  def rounded_percentage(person_type)
    ((person_type.to_f / population.to_f) * 100).to_i.to_s + '%'
  end
end
