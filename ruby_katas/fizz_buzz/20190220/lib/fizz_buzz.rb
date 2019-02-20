class FizzBuzz
  FIZZ = 'Fizz'
  BUZZ = 'Buzz'

  def initialize(check_digit: false)
    @check_digit = check_digit
  end

  def call(input)
    return input.map { |n| execute(n) } if input.kind_of?(Enumerable)
    execute(input)
  end

  private

  def execute(input)
    return FIZZ + BUZZ if fizz?(input) && buzz?(input)
    return FIZZ if fizz?(input)
    return BUZZ if buzz?(input)
    input
  end

  def fizz?(input)
    apply_rule_for(input, 3)
  end

  def buzz?(input)
    apply_rule_for(input, 5)
  end

  def apply_rule_for(input, n)
    if(@check_digit)
      input % n == 0 || input.to_s.include?(n.to_s)
    else
      input % n == 0
    end
  end
end
