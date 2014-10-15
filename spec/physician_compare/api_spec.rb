require 'spec_helper'
require 'json'

describe PhysicianCompare::Api do

  let(:api_json) { [
    {
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
      "pqrs" => "N",
      "ind_pac_id" => "5890732267",
      "ln_2_sprs" => "N"
    }]
  }

  let(:api) { PhysicianCompare::Api.new }

  describe '#fetch_physicians' do
    before { allow(Net::HTTP).to receive(:get) { JSON.generate(api_json) } }

    context 'with no params' do
      let(:expected_uri) { URI('http://data.medicare.gov/resource/s63f-csi6.json') }

      subject { api.fetch_physicians }

      it 'calls the api' do
        expect(Net::HTTP).to receive(:get).with(expected_uri)
        subject
      end

      it 'returns the resulting json as a hash' do
        expect(subject).to eq api_json
      end
    end

    context 'with some params' do
      let(:expected_uri) { URI('http://data.medicare.gov/resource/s63f-csi6.json?%24limit=100') }

      subject { api.fetch_physicians({ '$limit' => 100 }) }

      it 'calls the api with the additional params' do
        expect(Net::HTTP).to receive(:get).with(expected_uri)
        subject
      end
    end
  end

end