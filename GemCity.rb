class GemCity

=begin
This class represents the town of GemCity
This is a town riddled with crime but we can find out how happy the town is
=end
  def initialize
    @people, @population = {
     :thieves => 5, 
       :Officers => 1},
       50
    end

  def thieves thieves_number=@people[:thieves]
     return @people[:thieves] = thieves_number
  end

  def officers
    return @people[:Officers] 
  end

  def population; return @population; end

  def setOfficers officers
    @people[:Officers] = officers
  end

  def happiness_of_town
    #happiness is random... people don't know what they want!
    happinessVals = Array.new
     happiness = 0
    for index in (1..@population)
      happinessVals.push(rand((100 - successful_crime_rate) .. 100))
      index += 1
    end
    happinessVals.each do |value|
      happiness += value
    end
    return happiness / 100
  end

  def successful_crime_rate
    thieves = @people[:thieves]
    officers = @people[:Officers]
    if thieves <= 0
      odds_percent = 0
    elsif officers > thieves
      odds_percent = 0
    else
      odds = 1 \
       - officers.to_f / thieves.to_f
      odds_percent = odds * 100
    end
    return odds_percent
  end
end