module PhysicianCompare
  class GroupPractice

    API_KEYS = [
        "org_lgl_nm","org_pac_id","num_org_mem","adr_ln_1","adr_ln_2",
        "ln_2_sprs","cty","st","zip"
    ]

    def initialize(params)
      @data = params
    end

    def name
      @data['org_lgl_nm']
    end

    def pac_id
      @data['org_pac_id']
    end

    def member_count
      @data['num_org_mem'].to_i
    end

    def address1
      @data['adr_ln_1']
    end

    def address2
      @data['adr_ln_2']
    end

    def address2_suppressed?
      @data['ln_2_sprs'] == 'Y' ? true : false
    end

    def city
      @data['cty']
    end

    def state
      @data['st']
    end

    def zip
      @data['zip']
    end
  end
end