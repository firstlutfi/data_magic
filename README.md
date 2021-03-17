# data_magic (updated version)

This gem is ported from the original data_magic gem -> [here](https://github.com/cheezy/data_magic). Please read the original documentation first.
I created this to make sure the gem stays updated with its dependencies. (The original gem seems to be unmaintained)

## How to Use
Requirement:
* Ruby >= 2.5.1
* Faker >= 1.9

Update your Gemfile to

````ruby
gem 'data_magic', git: 'https://github.com/firstlutfi/data_magic.git', branch: 'master'
````
Then run 
````ruby
bundle install
````
Any other configuration is exactly same as the original gem.

NOTE:
If you have previously used older version of Faker, I suggest you to install [rubocop-faker](https://github.com/koic/rubocop-faker) to automatically update from positional arguments to named arguments.

## New & Updated Generator

Here is a list of the new and updated methods:

| new methods added | updated methods | replaced methods |
| --- | --- | --- |
| color_hex | job_title<sup>1</sup> | title |
| color_name | 
| number(digits=5, leading_zero=true) |
| decimal(before_decimal=5, after_decimal=3) |
| merge(separator='_', [first_name, city, number(digits=3)]) |
| date_between(from='01/01/2021', to='31/01/2021', format='%d/%m/%Y') |

<sup>1</sup> In newer version of Faker, Faker::Name.title is changed to Faker::Job.title

## Copyright

Copyright (c) 2012-2021 [Jeffrey S. Morgan](https://github.com/cheezy/data_magic). See LICENSE for details.
