require 'rails_helper'

describe SpaceMission, type: :model do
  describe 'relationships' do
    it { should have_many(:astronaut_space_missions)}
    it { should have_many(:astronauts).through(:astronaut_space_missions)}
  end
end
