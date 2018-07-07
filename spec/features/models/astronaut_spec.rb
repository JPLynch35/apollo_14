require 'rails_helper'

describe Astronaut, type: :model do
  describe 'relationships' do
    it { should have_many(:astronaut_space_missions)}
    it { should have_many(:space_missions).through(:astronaut_space_missions)}
  end
  describe 'class methods' do
    it 'should calculate the average age when calling method average_age' do
      astro_1 = Astronaut.create(name: 'Billy', age: 50, job: 'Commander')
      astro_2 = Astronaut.create(name: 'Bob', age: 30, job: 'Beer Boy')
      astro_3 = Astronaut.create(name: 'Thor', age: 40, job: 'Just There for Fun')

      expect(Astronaut.average_age).to eq(40)
    end
    it 'should alphabetize space missions by title' do
      astro = Astronaut.create(name: 'Thor', age: 40, job: 'Just There for Fun')
      space_mission_a = astro.space_missions.create(title: 'Pluto Ride', trip_length: 900)
      space_mission_b = astro.space_missions.create(title: 'Just Checking Things Out', trip_length: 404)
      space_mission_c = astro.space_missions.create(title: 'Another Round of Checking Things Out', trip_length: 10)

      expect(astro.alphabetize_missions.first.title).to eq('Another Round of Checking Things Out')
    end
    it 'should calculate the total time in space of the astronaut' do
      astro = Astronaut.create(name: 'Thor', age: 40, job: 'Just There for Fun')
      space_mission_a = astro.space_missions.create(title: 'Pluto Ride', trip_length: 900)
      space_mission_b = astro.space_missions.create(title: 'Just Checking Things Out', trip_length: 404)
      space_mission_c = astro.space_missions.create(title: 'Another Round of Checking Things Out', trip_length: 10)

      expect(astro.time_in_space).to eq(1314)
    end
  end
end
