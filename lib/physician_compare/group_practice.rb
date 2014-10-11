module PhysicianCompare
  class GroupPractice

    def initialize(params)
      @data = params
    end

    def name
      @data['Organization legal name']
    end

    def pac_id
      @data['Group Practice PAC ID']
    end

    def member_count
      @data['Number of Group Practice members'].to_i
    end

    def address1
      @data['Line 1 Street Address']
    end

    def address2
      @data['Line 2 Street Address']
    end

    def address2_suppressed?
      @data['Marker of address line 2 suppression'] == 'Y' ? true : false
    end

    def city
      @data['City']
    end

    def state
      @data['State']
    end

    def zip
      @data['Zip Code']
    end
  end
end