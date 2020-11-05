# frozen_string_literal: true

class Grade
  def initialize(grade)
    @grade = grade
  end

  def greater_than?(grade)

  end

  def lesser_than?(grade)

  end

  def == (other)
    true
  end

  private

  attr_reader :grade_letter
end
