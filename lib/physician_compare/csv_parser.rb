require 'csv'

module PhysicianCompare
  class CsvParser
    include Enumerable

    def initialize file_path
      @csv = CSV.open(file_path, headers: true)

      validate_csv
    end

    def each
      @csv.each do |physician|
        yield PhysicianCompare::Physician.new(physician)
      end
    end

    private

    def validate_csv
      # have to read a line before headers are set
      @csv.first

      unless @csv.headers == PhysicianCompare::CSV_HEADERS
        raise 'Invalid file format'
      end

      @csv.rewind
    end
  end
end