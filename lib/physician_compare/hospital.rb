module PhysicianCompare
  class Hospital

    def initialize params
      @data = params
    end

    def medicare_ccn
      @data['CCN']
    end

    def legal_business_name
      @data['legal_business_name']
    end

  end
end