require 'rails_helper'

describe AstronautSpaceMission, type: :model do
  describe 'relationships' do
    it { should belong_to(:astronaut)}
    it { should belong_to(:space_mission)}
  end
end
