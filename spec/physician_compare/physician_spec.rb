require 'spec_helper'

describe PhysicianCompare::Physician do

  let(:physician_params) {{
      "org_pac_id" => "4789850256",
      "num_org_mem" => "1",
      "ind_enrl_id" => "I20050418000159",
      "npi" => "1184828550",
      "gndr" => "F",
      "frst_nm" => "DONNA",
      "lst_nm" => "GILCHRIST",
      "mid_nm" => "F",
      "suff" => "III",
      "cty" => "NORTH BRUNSWICK",
      "grd_yr" => "1998",
      "hosp_afl_1" => "050625",
      "hosp_afl_lbn_1" => "CEDARS-SINAI MEDICAL CENTER",
      "hosp_afl_2" => "050262",
      "hosp_afl_lbn_2" => "REGENTS UNIV OF CALIF OF LOS ANGELES",
      "st" => "NJ",
      "med_sch" => "OTHER",
      "zip" => "089022285",
      "assgn" => "Y",
      "ehr" => "N",
      "cred" => "CSW",
      "org_lgl_nm" => "INTEGRATED THERAPEUTIC SERVICES",
      "pri_spec" => "CLINICAL SOCIAL WORKER",
      "sec_spec_1" => "NURSING",
      "sec_spec_2" => "MASSAGE",
      "sec_spec_3" => "INFORMATICS",
      "sec_spec_4" => "ONCOLOGY",
      "erx" => "N",
      "adr_ln_1" => "985 PATTON ST",
      "adr_ln_2" => "Suite 200",
      "pqrs" => "N",
      "ind_pac_id" => "5890732267",
      "ln_2_sprs" => "N"
  }}

  let(:physician) { PhysicianCompare::Physician.new(physician_params) }

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
      before { physician_params['org_lgl_nm'] = nil }

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
    it { expect(subject.last.legal_business_name).to eq 'REGENTS UNIV OF CALIF OF LOS ANGELES'}
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