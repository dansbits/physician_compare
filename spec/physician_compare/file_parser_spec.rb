require 'spec_helper'

describe PhysicianCompare::Parser do

  describe '#initialize' do

    subject { PhysicianCompare::Parser.new(file) }

    context 'when the file exists' do

      context 'when the file is in the right format' do
        let(:file) { 'spec/data/test_data.csv' }

        it 'does not raise any errors' do
          expect{subject}.to_not raise_error
        end

      end

      context 'when the headings are not as expected' do
        let(:file) { 'spec/data/invalid_file.csv' }
        it 'raises an exception' do
          expect{subject}.to raise_error 'Invalid file format: headers do not match expected.'
        end
      end
    end

    context 'when the file doesnt exist' do
      let(:file) { '/bad/path' }

      it 'raises an exception' do
        expect{subject}.to raise_error 'File not found'
      end
    end
  end

  describe '#each' do

    let(:parser) { PhysicianCompare::Parser.new('spec/data/test_data.csv') }

    it 'iterates over the whole file' do
      count = 0

      parser.each do |item|
        count += 1
      end

      expect(count).to eq 16
    end

    it 'yields a physician object for each row in the file' do
      parser.each do |physician|
        expect(physician).to be_a_kind_of PhysicianCompare::Physician
      end
    end

  end
end