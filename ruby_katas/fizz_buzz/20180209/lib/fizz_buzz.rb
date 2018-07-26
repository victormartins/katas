class FizzBuzzRules
  def div_by?(input, *divs)                  # Only pass DATA, not other behaviour
    # puts "div_by?(#{input}, #{divs})"        # Log what you do for easy debugging
    divs.map { |div| input % div == 0 }.all?
  end

  def has_digit?(input, digit)
    input.to_s.include?(digit.to_s)
  end
end

class LoudFizzBuzzRules < FizzBuzzRules
  def div_by?(input, *divs)
    result = super(input, *divs)
    puts 'YAY'
    result
  end
end

class FizzBuzz
  BUZZ = 'Buzz'.freeze
  FIZZ = 'Fizz'.freeze

  attr_reader :rules

  def initialize(check_digit: false, rules: FizzBuzzRules.new)
    @rules       = rules
    @check_digit = check_digit
  end

  def call(input)
    puts "INPUT = #{input}"
    return procedure(input) if input.is_a?(Integer)      # We deal with a single input here
    input.map { |num| procedure(num) }                   # We transform collections using our behaviour here
  end

  private

  # Main functional behaviour is isolated here
  def procedure(input)
    return FIZZ + BUZZ if rules.div_by?(input, 3, 5)
    return FIZZ if rules.div_by?(input, 3)
    return BUZZ if rules.div_by?(input, 5)
    return FIZZ if rules.has_digit?(input, 3) if @check_digit
    return BUZZ if rules.has_digit?(input, 5) if @check_digit
    input
  end
end


# Current Behaviour is FizzBuzz  = (FizzBuzzRules)
# Injecting new behaviour with our new LoudFizzBuzzRules
FizzBuzz.new(rules: LoudFizzBuzzRules.new).call(3)

# Now we want to compose behaviour. We want call the Admin everytime a FizzBuzz is executed
# FizzBuzz = (FizzBuzzRules + Contact Admin)

class ContactAdmin
  def call
    puts "SENDING EMAIL TO ADMIN"
  end
end

class FizzBuzzWithAdmin
  attr_reader :default_rules

  def initialize(default_rules: LoudFizzBuzzRules.new)
    @default_rules = default_rules
  end

  def call(input, *divs)
    FizzBuzz.new(rules: default_rules).call(input, *divs)
    ContactAdmin.new.call
  end
end

# This new class will execute the game and will call admins in the process
FizzBuzzWithAdmin.new.call(3)
