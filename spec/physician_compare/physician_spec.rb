require 'spec_helper'

describe PhysicianCompare::Physician do

  let(:csv_row) { CSV.open('spec/data/good_data.csv', headers: true).first.to_hash }

  let(:physician) { PhysicianCompare::Physician.new(csv_row) }

  describe '#npi' do
    subject { physician.npi }

    it { expect(subject).to eq '1184828550' }
  end

  describe '#address1' do
    subject { physician.address1 }
    it { expect(subject).to eq '985 PATTON ST' }
  end

  describe '#address2' do
    subject { physician.address2 }
    it { expect(subject).to eq 'Apt 2' }
  end

  describe '#address2_suppressed' do
    subject { physician.address2_suppressed }
    it { expect(subject).to eq false }
  end

  describe '#city' do
    subject { physician.city }
    it { expect(subject).to eq 'NORTH BRUNSWICK' }
  end

  describe '#state' do
    subject { physician.state }
    it { expect(subject).to eq 'NJ' }
  end

  describe '#zip_code' do
    subject { physician.zip_code }
    it { expect(subject).to eq '089022285' }
  end

  describe '#pac_id' do
    subject { physician.pac_id }

    it { expect(subject).to eq '5890732267' }
  end

  describe '#professional_enrollment_id' do
    subject { physician.professional_enrollment_id }

    it { expect(subject).to eq 'I20050418000159' }
  end

  describe '#last_name' do
    subject { physician.last_name }

    it { expect(subject).to eq 'GILCHRIST' }
  end

  describe '#first_name' do
    subject { physician.first_name }

    it { expect(subject).to eq 'DONNA' }
  end

  describe '#middle_name' do
    subject { physician.middle_name }

    it { expect(subject).to eq 'F' }
  end

  describe '#name_suffix' do
    subject { physician.name_suffix }

    it { expect(subject).to eq 'III' }
  end

  describe '#gender' do
    subject { physician.gender }

    it { expect(subject).to eq 'F' }
  end

  describe '#medical_credential' do
    subject { physician.medical_credential }

    it { expect(subject).to eq 'CSW' }
  end

  describe '#medical_school' do
    subject { physician.medical_school }

    it { expect(subject).to eq 'OTHER' }
  end

  describe '#graduation_year' do
    subject { physician.graduation_year }

    it { expect(subject).to eq 1998 }
  end

  describe '#primary_specialty' do
    subject { physician.primary_specialty }

    it { expect(subject).to eq 'CLINICAL SOCIAL WORKER' }
  end

  describe '#secondary_specialties' do
    subject { physician.secondary_specialties }

    it { expect(subject).to eq %w[NURSING MASSAGE INFORMATICS ONCOLOGY] }
  end

  describe '#has_group_practice?' do
    subject { physician.has_group_practice? }

    context 'when the physician has a group practice' do
      it { expect(subject).to eq true }
    end

    context 'when the physician doesnt have a group practice' do
      before { csv_row['Group Practice PAC ID'] = nil }

      it { expect(subject).to eq false }
    end
  end

  describe '#group_practice' do
    subject { physician.group_practice }

    let(:expected_hash) {
      {
          legal_name: 'INTEGRATED THERAPEUTIC SERVICES',
          pac_id: '4789850256',
          member_count: 1,
          address1: '985 PATTON ST',
          address2: nil,
          address2_suppressed: false,
          city: 'NORTH BRUNSWICK',
          state: 'NJ',
          zip_code: '089022285'
      }
    }

    it 'returns a GroupPractice with the right values' do
      expect(subject[:legal_name]).to eq 'INTEGRATED THERAPEUTIC SERVICES'
    end
  end

  describe '#affiliated_hospitals' do
    subject { physician.affiliated_hospitals }

    it { expect(subject.length).to eq 2 }

    it { expect(subject.first[:ccn]).to eq '12345'}
    it { expect(subject.last[:legal_business_name]).to eq 'Joes Discount Hospital'}
  end

  describe '#accepts_medicare_as_full_payment' do
    subject { physician.accepts_medicare_as_full_payment? }

    it { expect(subject).to eq true }
  end

  describe '#erx_participant' do
    subject { physician.erx_participant? }

    it { expect(subject).to eq false }
  end

  describe '#pqrs_participant' do
    subject { physician.pqrs_participant? }

    it { expect(subject).to eq false }
  end

  describe '#ehr_participant?' do
    subject { physician.ehr_participant? }

    it { expect(subject).to eq false }
  end
end