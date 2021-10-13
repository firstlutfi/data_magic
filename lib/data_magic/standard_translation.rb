# frozen_string_literal: true

module DataMagic
  module StandardTranslation
    attr_reader :parent

    #
    # return a random name (first and last)
    #
    def full_name
      Faker::Name.name
    end
    alias dm_full_name full_name

    #
    # return a random first name
    #
    def first_name
      Faker::Name.first_name
    end
    alias dm_first_name first_name

    #
    # return a random last name
    #
    def last_name
      Faker::Name.last_name
    end
    alias dm_last_name last_name

    #
    # return a random name prefix
    #
    def name_prefix
      Faker::Name.prefix
    end
    alias dm_name_prefix name_prefix

    #
    # return a random name suffix
    #
    def name_suffix
      Faker::Name.suffix
    end
    alias dm_name_suffix name_suffix

    #################################################################################
    #  In newer version of Faker, Faker::Name.title is changed to Faker::Job.title  #
    #################################################################################

    #
    # return a random job title
    #
    def job_title
      Faker::Job.title
    end
    alias dm_job_title job_title

    #
    # return a random street address
    #
    def street_address(include_secondary = false)
      Faker::Address.street_address(include_secondary: include_secondary)
    end
    alias dm_street_address street_address

    #
    # return a random secondary address
    #
    def secondary_address
      Faker::Address.secondary_address
    end
    alias dm_secondary_address secondary_address

    #
    # return a random city
    #
    def city
      Faker::Address.city
    end
    alias dm_city city

    #
    # return a random state
    #
    def state
      Faker::Address.state
    end
    alias dm_state state

    #
    # return a random state abbreviation
    #
    def state_abbr
      Faker::Address.state_abbr
    end
    alias dm_state_abbr state_abbr

    #
    # return a random 5 or 9 digit zip code
    #
    def zip_code
      Faker::Address.zip
    end
    alias dm_zip_code zip_code

    #
    # return a random country
    #
    def country
      Faker::Address.country
    end
    alias dm_country country

    #
    # return a random company name
    #
    def company_name
      Faker::Company.name
    end
    alias dm_company_name company_name

    #
    # return a random catch phrase
    #
    def catch_phrase
      Faker::Company.catch_phrase
    end
    alias dm_catch_phrase catch_phrase

    #
    # return a credit card number
    #
    def credit_card_number
      Faker::Business.credit_card_number
    end
    alias dm_credit_card_number credit_card_number

    #
    # return a credit card type
    #
    def credit_card_type
      Faker::Business.credit_card_type
    end
    alias dm_credit_card_type credit_card_type

    #
    # return random words - default is 3 words
    #
    def words(number = 3)
      Faker::Lorem.words(number: number).join(' ')
    end
    alias dm_words words

    #
    # return a random sentence - default minimum word count is 4
    #
    def sentence(min_word_count = 4)
      Faker::Lorem.sentence(word_count: min_word_count)
    end
    alias dm_sentence sentence

    #
    # return random sentences - default is 3 sentences
    #
    def sentences(sentence_count = 3)
      Faker::Lorem.sentences(number: sentence_count).join(' ')
    end
    alias dm_sentences sentences

    #
    # return random paragraphs - default is 3 paragraphs
    #
    def paragraphs(paragraph_count = 3)
      Faker::Lorem.paragraphs(number: paragraph_count).join('\n\n')
    end
    alias dm_paragraphs paragraphs

    #
    # return random characters - default is 255 characters
    #
    def characters(character_count = 255)
      Faker::Lorem.characters(number: character_count)
    end
    alias dm_characters characters

    #
    # return a random email address
    #
    def email_address(name = nil, domain = nil)
      Faker::Internet.email(name: name, domain: domain)
    end
    alias dm_email_address email_address

    #
    # return a random domain name
    #
    def domain_name
      Faker::Internet.domain_name
    end
    alias dm_domain_name domain_name

    #
    # return a random url
    #
    def url
      Faker::Internet.url
    end
    alias dm_url url

    #
    # return a random user name
    #
    def user_name
      Faker::Internet.user_name
    end
    alias dm_user_name user_name

    #
    # return a random phone number
    #
    def phone_number
      value = Faker::PhoneNumber.phone_number
      remove_extension(value)
    end
    alias dm_phone_number phone_number

    #
    # return a random cell number
    #
    def cell_phone
      value = Faker::PhoneNumber.cell_phone
      remove_extension(value)
    end
    alias dm_cell_phone cell_phone

    #
    # return a random value from an array or range
    #
    def randomize(value)
      case value
      when Array then value[rand(value.size)]
      when Range then rand((value.last + 1) - value.first) + value.first
      else value
      end
    end
    alias dm_randomize randomize

    #
    # return an element from the array.  The first request will return
    # the first element, the second request will return the second,
    # and so forth.
    #
    def sequential(value)
      index = index_variable_for(value)
      index = (index ? index + 1 : 0)
      index = 0 if index == value.length
      set_index_variable(value, index)
      value[index]
    end

    #
    # return a value based on a mast
    # The # character will be replaced with a number
    # The A character will be replaced with an upper case letter
    # The a character will be replaced with a lower case letter
    #
    def mask(value)
      result = ''
      value.each_char do |ch|
        result += case ch
                  when '#' then randomize(0..9).to_s
                  when 'A' then ('A'..'Z').to_a[rand(26)]
                  when 'a' then ('a'..'z').to_a[rand(26)]
                  else ch
                  end
      end
      result
    end
    alias dm_mask mask

    ##################################################################
    #                                                                #
    #                   NEW TRANSLATOR STARTS HERE                   #
    #                                                                #
    ##################################################################

    #
    # return a random color code in hex
    #
    def color_hex
      Faker::Color.hex_color
    end
    alias dm_color_hex color_hex

    #
    # return a random color name
    #
    def color_name
      Faker::Color.color_name
    end
    alias dm_color_name color_name

    #
    # return a random number in specified digits
    #
    def number(digits, leading_zero = false)
      leading_zero ? Faker::Number.leading_zero_number(digits: digits) : Faker::Number.number(digits: digits)
    end
    alias dm_number number

    #
    # return a random number in decimal
    #
    def decimal(before_decimal, after_decimal = 2)
      Faker::Number.decimal(l_digits: before_decimal, r_digits: after_decimal)
    end
    alias dm_decimal decimal

    #
    # merge variables
    #
    def merge(separator = ' ', *params)
      params.join(separator)
    end
    alias dm_merge merge

    ##################################################################
    #                                                                #
    #                   NEW TRANSLATOR ENDS HERE                     #
    #                                                                #
    ##################################################################

    private

    def set_index_variable(ary, value)
      index_hash[index_name(ary)] = value
    end

    def index_variable_for(ary)
      value = index_hash[index_name(ary)]
      index_hash[index_name(ary)] = -1 unless value
      index_hash[index_name(ary)]
    end

    def index_name(ary)
      "#{ary[0]}#{ary[1]}_index".gsub(' ', '_').downcase
    end

    def index_hash
      dh = data_hash[parent]
      data_hash[parent] = {} unless dh
      data_hash[parent]
    end

    def data_hash
      $data_magic_data_hash ||= {}
    end

    def process(value)
      eval value
    end

    def remove_extension(phone)
      index = phone.index('x')
      phone = phone[0, (index - 1)] if index
      phone
    end
  end
end
