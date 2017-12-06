require_relative './../lib/main.rb'

RSpec.describe Main do
  let(:data) { {} }

  it 'foo' do
    Main.new.call(data)
  end
end
