require 'spec_helper'

describe PhysicianCompare::Physician do

  let(:params) { CSV.open('spec/data/test_data.csv', headers:true).first.to_hash }
  let(:physician) { PhysicianCompare::Physician.new(params) }

  describe '#initialize' do

    subject { PhysicianCompare::Physician.new(params) }

    context 'when the params do not contain the proper keys' do
      let(:params) { { foo: 'bad', bar: 'params' } }

      it 'raises an error' do
        expect{subject}.to raise_error 'Invalid params: keys do not match expected.'
      end
    end

    context 'when the params match the proper keys' do

      it 'does not raise an error' do
        expect{subject}.to_not raise_error
      end
    end
  end

  describe '#npi' do
    subject { physician.npi }

    it { expect(subject).to eq '1184828550' }
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

    it { expect(subject).to eq 'M' }
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
      before { params['Organization legal name'] = nil }

      it { expect(subject).to eq false }
    end
  end

  describe '#group_practice' do
    subject { physician.group_practice }

    it { expect(subject).to be_a_kind_of PhysicianCompare::GroupPractice }

    it 'returns a GroupPractice with the right values' do
      expect(subject.name).to eq 'INTEGRATED THERAPEUTIC SERVICES'
    end
  end

  describe '#affiliated_hospitals' do
    subject { physician.affiliated_hospitals }

    it { expect(subject.length).to eq 2 }

    it { expect(subject.first).to be_a PhysicianCompare::Hospital }
    it { expect(subject.first.medicare_ccn).to eq '050625'}
    it { expect(subject.last.legal_business_name).to eq 'Rando Med Center'}
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
    subject { physician.pqrs_participant? }

    it { expect(subject).to eq false }
  end
end