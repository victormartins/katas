# frozen_string_literal: true

# The Problem here is that we a primitive string does not behave like a grade
# so we need to give some behaviour to the string to make it a grade
class GradeComparer
  def call(grade_letter, other)
    # return 1  if grade_letter > other
    # return 0  if grade == other
    # return -1 if grade < other

    raise 'Unexpected Condition!'
  end
end
