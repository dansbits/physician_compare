require 'spec_helper'

describe PhysicianCompare::Hospital do

  let(:hospital_params) {{
      'CCN' => '050625',
      'legal_business_name' => 'CEDARS-SINAI MEDICAL CENTER'
  }}

  let(:hospital) { PhysicianCompare::Hospital.new(hospital_params) }

  describe '#medicare_ccn' do
    subject { hospital.medicare_ccn }

    it { expect(subject).to eq '050625' }
  end

  describe '#legal_business_name' do
    subject { hospital.legal_business_name }

    it { expect(subject).to eq 'CEDARS-SINAI MEDICAL CENTER' }
  end

end