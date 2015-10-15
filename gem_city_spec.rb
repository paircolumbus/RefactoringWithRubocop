require 'rspec'
require_relative 'gem_city' # This line may need to be changed

describe 'Gem City' do
  let(:city) { GemCity.new }
  it 'Initialize City' do
    expect(city.thieves).to eq(5)
    expect(city.officers).to eq(1)
    expect(city.population).to eq(50)
  end

  context 'check_crime_rate' do
    it 'on initialize' do
      expect(city.successful_crime_rate).to eq(80)
    end

    it 'officers = thieves' do
      city.thieves = 1
      city.officers = 1 # This line may need to be changed
      expect(city.successful_crime_rate).to eq(0)
    end

    it 'thieves = 0' do
      city.thieves = 0
      expect(city.successful_crime_rate).to eq(0)
    end

    it 'officers > thieves' do
      city.thieves = 1
      city.officers = 2 # This line may need to be changed
      expect(city.successful_crime_rate).to eq(0)
    end
  end

  context 'happiness' do
    it 'on initialize' do
      expect((10..50).include? city.happiness_of_town).to eq(true)
    end

    it 'successful_crime_rate = 0' do
      city.thieves = 0
      expect(city.happiness_of_town).to eq(50)
    end
  end

  context 'city_demographics' do
    it 'initialize' do
      demographics = city.city_demographics
      expect(demographics[:thieves]).to eq('10%')
      expect(demographics[:officers]).to eq('2%')
      expect(demographics[:civilians]).to eq('88%')
    end

    it 'thieves = 10, officers = 25' do
      city.thieves = 10
      city.officers = 25
      demographics = city.city_demographics
      expect(demographics[:thieves]).to eq('20%')
      expect(demographics[:officers]).to eq('50%')
      expect(demographics[:civilians]).to eq('30%')
    end
  end
end
