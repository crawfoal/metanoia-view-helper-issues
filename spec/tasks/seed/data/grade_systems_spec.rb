require 'rails_helper'

RSpec.describe 'GradeSystem seed data' do
  describe 'Hueco Scale' do
    subject(:hueco_scale) { GradeSystem.find_by_name 'Hueco' }

    it { should be_present }

    it 'has all of the grades defined' do
      expect(hueco_scale.grades.map(&:name)).to \
        eq %w(VB V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16)
    end
  end

  describe 'YDS' do
    subject(:yds) { GradeSystem.find_by_name 'Yosemite' }

    it { should be_present }

    it 'has all of the grades defined' do
      expect(yds.grades.map(&:name)).to eq \
        %w(
          5.5 5.6 5.7 5.8 5.9 5.10a 5.10b 5.10c 5.10d
          5.11a 5.11b 5.11c 5.11d 5.12a 5.12b 5.12c 5.12d
          5.13a 5.13b 5.13c 5.13d 5.14a 5.14b 5.14c 5.14d
          5.15a 5.15b 5.15c
        )
    end
  end
end
