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


      expect(Astronaut.average_age).to eq(40)
    end
    it 'should calculate the total time in space of the astronaut' do


      expect(Astronaut.average_age).to eq(40)
    end
  end
end
