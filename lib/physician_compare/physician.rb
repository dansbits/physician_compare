module PhysicianCompare
  class Physician

    def initialize(params)
      @data = params
    end

    def accepts_medicare_as_full_payment?
      @data['assgn'] == 'Y' ? true : false
    end

    def affiliated_hospitals
      hospitals = []

      (1..5).each do |number|
        unless @data["hosp_afl_#{number}"].nil?
          hospital_params = {
              'CCN' => @data["hosp_afl_#{number}"],
              'legal_business_name' => @data["hosp_afl_lbn_#{number}"]
          }

          hospitals.push PhysicianCompare::Hospital.new hospital_params
        end
      end

      hospitals
    end

    def ehr_participant?
      @data['ehr'] == 'Y' ? true : false
    end

    def erx_participant?
      @data['erx'] == 'Y' ? true : false
    end

    def first_name
      @data['frst_nm']
    end

    def gender
      @data['gndr']
    end

    def graduation_year
      @data['grd_yr'].to_i
    end

    def group_practice
      if has_group_practice?
        group_practice_params = @data.select { |key, value| PhysicianCompare::GroupPractice::API_KEYS.include? key }
        PhysicianCompare::GroupPractice.new(group_practice_params)
      end
    end

    def has_group_practice?
      !!@data['org_lgl_nm']
    end

    def last_name
      @data['lst_nm']
    end

    def medical_credential
      @data['cred']
    end

    def medical_school
      @data['med_sch']
    end

    def middle_name
      @data['mid_nm']
    end

    def name_suffix
      @data['suff']
    end

    def npi
      @data['npi']
    end

    def pac_id
      @data['ind_pac_id']
    end

    def pqrs_participant?
      @data['Participating in PQRS'] == 'Y' ? true : false
    end

    def primary_specialty
      @data['pri_spec']
    end

    def professional_enrollment_id
      @data['ind_enrl_id']
    end

    def secondary_specialties
      specialty_fields = ['sec_spec_1','sec_spec_2','sec_spec_3','sec_spec_4']

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
  end
end