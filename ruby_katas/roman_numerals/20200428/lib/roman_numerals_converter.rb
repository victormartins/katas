# frozen_string_literal: true

require 'contracts'

class RomanNumeralsConverter
  include Contracts::Core
  include Contracts::Builtin

  ROMAN_NUMERALS = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }.freeze

  def convert(_number)
    {
      foo: :bar,
      baz: 1
    }

    has_many: foo bar:asd

    File.exist?

    File.exist?

    {
      foo: 1
    }
  end

  def foo; end
end
