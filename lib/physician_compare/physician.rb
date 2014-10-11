module PhysicianCompare
  class Physician

    def initialize(params)
      @data = params

      validate_data
    end

    def accepts_medicare_as_full_payment
      @data['Professional accepts Medicare Assignment'] == 'Y' ? true : false
    end

    def affiliated_hospitals
      hospitals = []

      (1..5).each do |number|
        unless @data["Claims based hospital affiliation CCN #{number}"].nil?
          hospital_params = {
              'CCN' => @data["Claims based hospital affiliation CCN #{number}"],
              'legal_business_name' => @data["Claims based hospital affiliation LBN #{number}"]
          }

          hospitals.push PhysicianCompare::Hospital.new hospital_params
        end
      end

      hospitals
    end

    def ehr_participant?
      @data['Participating in EHR'] == 'Y' ? true : false
    end

    def erx_participant?
      @data['Participating in eRx'] == 'Y' ? true : false
    end

    def first_name
      @data['First Name']
    end

    def gender
      @data['Gender']
    end

    def graduation_year
      @data['Graduation year'].to_i
    end

    def group_practice
      if has_group_practice?
        group_practice_params = @data.select { |key, value| GROUP_PRACTICE_KEYS.include? key }
        PhysicianCompare::GroupPractice.new(group_practice_params)
      end
    end

    def has_group_practice?
      !!@data['Organization legal name']
    end

    def last_name
      @data['Last Name']
    end

    def medical_credential
      @data['Credential']
    end

    def medical_school
      @data['Medical school name']
    end

    def middle_name
      @data['Middle Name']
    end

    def name_suffix
      @data['Suffix']
    end

    def npi
      @data['NPI']
    end

    def pac_id
      @data['PAC ID']
    end

    def pqrs_participant?
      @data['Participating in PQRS'] == 'Y' ? true : false
    end

    def primary_specialty
      @data['Primary specialty']
    end

    def professional_enrollment_id
      @data['Professional Enrollment ID']
    end

    def secondary_specialties
      specialty_fields = ['Secondary specialty 1','Secondary specialty 2','Secondary specialty 3','Secondary specialty 4']

      specialties = []

      specialty_fields.each do |field|
        specialties.push @data[field] if @data[field]
      end

      specialties
    end

    private

    def group_practice_params
      @data.select do |key, value|
        PhysicianCompare::GROUP_PRACTICE_KEYS.include? key
      end
    end

    def validate_data
      unless @data.keys == EXPECTED_HEADERS
        raise 'Invalid params: keys do not match expected.'
      end
    end
  end
end