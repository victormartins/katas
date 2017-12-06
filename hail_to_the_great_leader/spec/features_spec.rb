require_relative './../lib/main.rb'

RSpec.describe Main do
  let(:data) do
    {
      enemy_of_the_state: true,
      location: { x: 1, y: 1}
    }
  end
  let(:nuke_response) do
    double(casualties: 100_000, photos: ['photo_1', 'photo_2'])
  end

  before do
    allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response)
  end

  it 'fires a nuke to a given location' do
    expect(Main.new.call(data)).to eq("The Leader is Happy!")
  end
end
