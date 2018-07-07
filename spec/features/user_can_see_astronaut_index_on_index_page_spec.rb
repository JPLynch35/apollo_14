require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /atronauts' do
    it 'should see a list of all the astronauts with the name, age, and job' do
      astro_1 = Astronaut.create(name: 'Billy', age: 25, job: 'Commander')
      astro_2 = Astronaut.create(name: 'Bob', age: 35, job: 'Beer Boy')

      visit astronauts_path

      expect(page).to have_content("Name: #{astro_1.name}")
      expect(page).to have_content("Age: #{astro_1.age}")
      expect(page).to have_content("Job: #{astro_1.job}")
      expect(page).to have_content("Name: #{astro_2.name}")
      expect(page).to have_content("Age: #{astro_2.age}")
      expect(page).to have_content("Job: #{astro_2.job}")
    end
    it 'should see an average age of all the astronauts' do
      astro_1 = Astronaut.create(name: 'Billy', age: 25, job: 'Commander')
      astro_2 = Astronaut.create(name: 'Bob', age: 35, job: 'Beer Boy')

      visit astronauts_path

      avg_age = Astronaut.average(:age)

      within('section') do
        expect(page).to have_content("Average Age: #{avg_age}")
      end
    end
  end
end
