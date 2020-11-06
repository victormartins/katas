# frozen_string_literal: true

class Grade
  class << self
    def for(other)
      return other if other.is_a?(Grade)

      new(other)
    end
  end

  attr_reader :letter, :sign

  def initialize(grade)
    @letter = grade[0]
    @sign   = grade[1]
  end

  def greater_than?(other)
    other = self.class.for(other)

    # puts
    # puts '+++' * 10
    # puts "#{self.letter}#{self.sign} vs #{other.letter}#{other.sign}"

    # When the letters are different, the signs don't really matter
    return self.letter < other.letter if self.letter != other.letter

    # When they are the same is always false
    return false if self == other

    # when the letters are equal we just need to check the left sign
    self.sign == '+' || other.sign == '-'
  end

  def lesser_than?(other)
    other = self.class.for(other)

    # puts
    # puts '---' * 10
    # puts "#{self.letter}#{self.sign} vs #{other.letter}#{other.sign}"

    # When the letters are different, the signs don't really matter
    return self.letter > other.letter if self.letter != other.letter

    # When they are the same is always false
    return false if self == other

    # when the letters are equal we just need to check the left sign
    return true if self.sign.to_s == '' && other.sign == '+'
    self.sign == '-' && (other.sign == '+' || other.sign.to_s == '')
  end

  def ==(other)
    other = self.class.for(other)

    # puts
    # puts '===' * 10
    # puts "#{self.letter} vs #{other.letter}"

    self.letter == other.letter && self.sign == other.sign
  end

  def to_s
    "#{self.letter}#{self.sign}"
  end
end
