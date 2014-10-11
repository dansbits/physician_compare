require 'csv'

module PhysicianCompare
  class Parser

    include Enumerable

    def each
      @physician_data.each do |physician|
        yield PhysicianCompare::Physician.new physician.to_hash
      end
    end

    def initialize file_loc
      raise 'File not found' unless File.exists?(file_loc)

      @physician_data = CSV.new(File.open(file_loc), headers: true)

      validate_file
    end

    private

    def validate_file
      # headers aren't set until you read something from the file
      @physician_data.first

      unless @physician_data.headers == EXPECTED_HEADERS
        raise 'Invalid file format: headers do not match expected.'
      end

      @physician_data.rewind
    end
  end
end