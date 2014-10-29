# Physician Compare

physician_compare is a gem which provides an easy way to read the csv files provided in the Medicare Physician Compare data set.

## Installation

Add this line to your application's Gemfile:

    gem 'hospital_compare', git: 'git@github.com:carp47/hospital_compare.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install physician_compare

## Usage

NOTE: There are several places where you can download the data and it can be in a different format. This gem is
intended to be used with the CSV dump which can be found under the export tab here:

https://data.medicare.gov/Physician-Compare/National-Downloadable-File/s63f-csi6

Here is a direct link to the data:

https://data.medicare.gov/api/views/s63f-csi6/rows.csv?accessType=DOWNLOAD

## Contributing

1. Fork it ( https://github.com/[my-github-username]/physician_compare/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
