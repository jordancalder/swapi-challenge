require 'rails_helper'

RSpec.describe Planet, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:swapi_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:diameter) }
    it { is_expected.to validate_presence_of(:rotation_period) }
    it { is_expected.to validate_presence_of(:orbital_period) }
    it { is_expected.to validate_presence_of(:gravity) }
    it { is_expected.to validate_presence_of(:population) }
    it { is_expected.to validate_presence_of(:climate) }
    it { is_expected.to validate_presence_of(:terrain) }
    it { is_expected.to validate_presence_of(:surface_water) }
    it { is_expected.to validate_presence_of(:residents) }
    it { is_expected.to validate_presence_of(:films) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:created) }
    it { is_expected.to validate_presence_of(:edited) }
  end
end
