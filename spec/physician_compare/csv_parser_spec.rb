require 'spec_helper'

describe PhysicianCompare::CsvParser do

  describe '#initialize' do
    describe 'validation' do
      subject { PhysicianCompare::CsvParser.new(file) }

      context 'with an improperly formatted file' do
        let(:file) { 'spec/data/bad_file.csv' }

        it { expect{subject}.to raise_error 'Invalid file format' }
      end

      context 'with properly formatted data' do
        let(:file) { 'spec/data/good_data.csv' }

        it { expect{subject}.to_not raise_error }
      end
    end
  end

  describe 'enumerable' do
    let(:parser) { PhysicianCompare::CsvParser.new('spec/data/good_data.csv') }
    describe '#each' do
      it 'iterates over the whole file' do
        count = 0

        parser.each { |p| count += 1 }

        expect(count).to eq 4
      end

      it 'yields a physician object' do
        parser.each { |p| expect(p).to be_a PhysicianCompare::Physician }
      end
    end
  end

end