# frozen_string_literal: true

require 'grade_comparer'

RSpec.describe GradeComparer do
  POSSIBLE_GRADES = %w(A+ A A- B+ B B- C+ C C- D+ D D- E+ E E- F+ F F-).freeze

  POSSIBLE_GRADES.each.with_index do |grade_letter, index|
    next_grade_letter = POSSIBLE_GRADES[index+1]

    return unless next_grade_letter

    it "returns 1 if #{grade_letter} is greater than #{next_grade_letter}" do
      expect(subject.call(grade_letter, next_grade_letter)).to eql(1)
    end

    it "returns -1 if #{next_grade_letter} is less than #{grade_letter}" do
      expect(subject.call(next_grade_letter, grade_letter)).to eql(-1)
    end

    it "returns 0 if #{grade_letter} is equal to #{grade_letter}" do
      expect(subject.call(grade_letter, grade_letter)).to eql(0)
    end
  end
end

