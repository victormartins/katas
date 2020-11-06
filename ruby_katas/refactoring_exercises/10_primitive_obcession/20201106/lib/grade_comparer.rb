# frozen_string_literal: true

# The Problem here is that we a primitive string does not behave like a grade
# so we need to give some behaviour to the string to make it a grade
class GradeComparer
  def call(grade_letter, other)
    grade = Grade.new(grade_letter)

    return 1  if grade.greater_than?(other)
    return 0  if grade == other
    return -1 if grade.lesser_than?(other)

    raise 'Unexpected Condition!'
  end
end
