require "physician_compare/version"

require "physician_compare/api"
require "physician_compare/physician"
require "physician_compare/csv_parser"


module PhysicianCompare

  CSV_HEADERS = [
      "NPI", "PAC ID", "Professional Enrollment ID", "Last Name", "First Name", "Middle Name",
      "Suffix", "Gender", "Credential", "Medical school name", "Graduation year", "Primary specialty",
      "Secondary specialty 1", "Secondary specialty 2", "Secondary specialty 3", "Secondary specialty 4",
      "All secondary specialties", "Organization legal name", "Group Practice PAC ID",
      "Number of Group Practice members", "Line 1 Street Address", "Line 2 Street Address",
      "Marker of address line 2 suppression", "City", "State", "Zip Code",
      "Claims based hospital affiliation CCN 1", "Claims based hospital affiliation LBN 1",
      "Claims based hospital affiliation CCN 2", "Claims based hospital affiliation LBN 2",
      "Claims based hospital affiliation CCN 3", "Claims based hospital affiliation LBN 3",
      "Claims based hospital affiliation CCN 4", "Claims based hospital affiliation LBN 4",
      "Claims based hospital affiliation CCN 5", "Claims based hospital affiliation LBN 5",
      "Professional accepts Medicare Assignment", "Participating in eRx", "Participating in PQRS",
      "Participating in EHR"
  ]

  CSV_GROUP_PRACTICE_HEADERS = [
      "Organization legal name","Group Practice PAC ID","Number of Group Practice members",
      "Line 1 Street Address","Line 2 Street Address","Marker of address line 2 suppression",
      "City","State","Zip Code"
  ]

end
