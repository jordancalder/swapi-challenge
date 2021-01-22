require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:swapi_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:birth_year) }
    it { is_expected.to validate_presence_of(:eye_color) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:hair_color) }
    it { is_expected.to validate_presence_of(:height) }
    it { is_expected.to validate_presence_of(:mass) }
    it { is_expected.to validate_presence_of(:skin_color) }
    it { is_expected.to validate_presence_of(:homeworld) }
    it { is_expected.to validate_presence_of(:films) }
    it { is_expected.to validate_presence_of(:species) }
    it { is_expected.to validate_presence_of(:starships) }
    it { is_expected.to validate_presence_of(:vehicles) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:created) }
    it { is_expected.to validate_presence_of(:edited) }

    it { is_expected.to allow_values('unknown', '19BBY', '20ABY').for(:birth_year)  }
    it { is_expected.not_to allow_values('blah', '1995', nil).for(:birth_year)  }

    it { is_expected.to allow_values('male', 'female', 'unknown', 'n/a').for(:gender) }
    it { is_expected.not_to allow_values('a', 1, nil).for(:gender) }

    it { is_expected.to allow_values('2021-01-21T09:21:11.061346Z').for(:created) }
    it { is_expected.not_to allow_values('2021.error', nil).for(:created) }

    it { is_expected.to allow_values('2021-01-21T09:21:11.061346Z').for(:edited) }
    it { is_expected.not_to allow_values('2021.error', nil).for(:edited) }
  end
end
