require 'spec_helper'

describe PhysicianCompare::GroupPractice do

  let (:physician_params) { CSV.open('spec/data/test_data.csv', headers:true).first.to_hash }
  let(:group_practice_params) {
    physician_params.select { |key,value| PhysicianCompare::GROUP_PRACTICE_KEYS.include? key }
  }

  let(:group_practice) { PhysicianCompare::GroupPractice.new(group_practice_params) }

  describe '#name' do
    subject { group_practice.name }
    it { expect(subject).to eq 'INTEGRATED THERAPEUTIC SERVICES' }
  end

  describe '#pac_id' do
    subject { group_practice.pac_id }
    it { expect(subject).to eq '4789850256' }
  end

  describe '#member_count' do
    subject { group_practice.member_count }
    it { expect(subject).to eq 1 }
  end

  describe '#address1' do
    subject { group_practice.address1 }
    it { expect(subject).to eq '985 PATTON ST' }
  end

  describe '#address2' do
    subject { group_practice.address2 }
    it { expect(subject).to eq 'Suite 200' }
  end

  describe '#address2_suppressed?' do
    subject { group_practice.address2_suppressed? }
    it { expect(subject).to eq false }
  end

  describe '#city' do
    subject { group_practice.city }
    it { expect(subject).to eq 'NORTH BRUNSWICK' }
  end

  describe '#state' do
    subject { group_practice.state }
    it { expect(subject).to eq 'NJ' }
  end

  describe '#zip' do
    subject { group_practice.zip }
    it { expect(subject).to eq '089022285' }
  end
end