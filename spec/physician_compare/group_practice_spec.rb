require 'spec_helper'

describe PhysicianCompare::GroupPractice do

  let(:group_practice_params) {{
    "org_pac_id" => "4789850256",
    "num_org_mem" => "1",
    "ind_enrl_id" => "I20050418000159",
    "npi" => "1184828550",
    "gndr" => "F",
    "frst_nm" => "DONNA",
    "lst_nm" => "GILCHRIST",
    "cty" => "NORTH BRUNSWICK",
    "grd_yr" => "1998",
    "st" => "NJ",
    "med_sch" => "OTHER",
    "zip" => "089022285",
    "assgn" => "Y",
    "ehr" => "N",
    "cred" => "CSW",
    "org_lgl_nm" => "INTEGRATED THERAPEUTIC SERVICES",
    "pri_spec" => "CLINICAL SOCIAL WORKER",
    "erx" => "N",
    "adr_ln_1" => "985 PATTON ST",
    "adr_ln_2" => "Suite 200",
    "pqrs" => "N",
    "ind_pac_id" => "5890732267",
    "ln_2_sprs" => "N"
  }}

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