# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Transactions::AddEmployee do
  it { expect(described_class.ancestors).to include(Transactions::Transaction) }

  it 'adds an employee' do
    employee_id = 1

    described_class.new(
      id: employee_id,
      name: 'Bob',
      foo: 'Home',
      amount: BigDecimal('1000.00')
    ).call

    employee = DataStore::Employees.find(employee_id)
    expect(employee.name).to eq(employee_name)
    expect(employee.type).to eq(Models::EmployeeClassification::SALARIED)
  end
end
