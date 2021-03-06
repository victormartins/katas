class FizzBuzz
  def initialize(options={})
    @extra = options.fetch(:extra) { false }
  end

  def call(numbers)
    result = Array(numbers).map { |n| process(n) }
    result = result.first if result.length == 1
    result
  end

  def process(number)
    return 'FizzBuzz' if div_by?(number, 3, 5)
    return 'Fizz' if  div_by?(number, 3)
    return 'Buzz' if  div_by?(number, 5)

    return 'Fizz' if @extra && number.to_s =~ /3/
    return 'Buzz' if @extra && number.to_s =~ /5/
    number
  end

  private

  def div_by?(number, *args)
    args.map { |num| number % num == 0 }.all?
  end
end
