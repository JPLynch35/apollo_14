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

      avg_age = Astronaut.average(:age).floor
      expect(page).to have_content("Average Age: #{avg_age}")
    end
    it 'should see a list of all space missions for each astronaut' do
      astro_1 = Astronaut.create(name: 'Billy', age: 50, job: 'Commander')
      space_mission_1a = astro_1.space_missions.create(title: 'Just Checking Things Out', trip_length: 404)
      space_mission_1b = astro_1.space_missions.create(title: 'To the Moon!', trip_length: 200)
      astro_2 = Astronaut.create(name: 'Bob', age: 30, job: 'Beer Boy')
      space_mission_2a = astro_2.space_missions.create(title: 'Just Checking Things Out', trip_length: 404)
      space_mission_2b = astro_2.space_missions.create(title: 'Another Day Another Dollar', trip_length: 99999)
      astro_3 = Astronaut.create(name: 'Thor', age: 40, job: 'Just There for Fun')
      space_mission_3a = astro_3.space_missions.create(title: 'Pluto Ride', trip_length: 900)
      space_mission_3b = astro_3.space_missions.create(title: 'Just Checking Things Out', trip_length: 404)
      space_mission_3c = astro_3.space_missions.create(title: 'Another Round of Checking Things Out', trip_length: 10)

      visit astronauts_path

      save_and_open_page

      expect(page).to have_content("Missions: #{space_mission_3c.title} #{space_mission_3c.trip_length} #{space_mission_3b.title} #{space_mission_3b.trip_length} #{space_mission_3a.title} #{space_mission_3a.trip_length}")
    end
    it 'should see a total count of time in space for each astronaut' do
      astro_1 = Astronaut.create(name: 'Billy', age: 50, job: 'Commander')
      space_mission_1a = astro_1.space_missions.create(title: 'Just Checking Things Out', trip_length: 404)
      space_mission_1b = astro_1.space_missions.create(title: 'To the Moon!', trip_length: 200)
      astro_2 = Astronaut.create(name: 'Bob', age: 30, job: 'Beer Boy')
      space_mission_2a = astro_2.space_missions.create(title: 'Just Checking Things Out', trip_length: 404)
      space_mission_2b = astro_2.space_missions.create(title: 'Another Day Another Dollar', trip_length: 99999)
      astro_3 = Astronaut.create(name: 'Thor', age: 40, job: 'Just There for Fun')
      space_mission_3a = astro_3.space_missions.create(title: 'Pluto Ride', trip_length: 900)
      space_mission_3b = astro_3.space_missions.create(title: 'Just Checking Things Out', trip_length: 404)
      space_mission_3c = astro_3.space_missions.create(title: 'Another Round of Checking Things Out', trip_length: 10)

      visit astronauts_path

      save_and_open_page

      expect(page).to have_content("Time in Space: #{astro_1.time_in_space} units of time")
    end
  end
end
