require 'order'

RSpec.describe Order do 

  subject(:order) { described_class.new(menu)}

  let(:menu) { double(:menu) }

  let(:dishes) do {
    pizza: 2,
    fish: 1
  }
end

before do 
  allow(menu).to receive(:has_dish?).with(:pizza).and_return true
  allow(menu).to receive(:has_dish?).with(:fish).and_return true
end

  it 'selects several dishes from menu' do 
    order.add(:pizza, 2)
    order.add(:fish, 1)
    expect(order.dishes).to eq dishes
  end

  it 'raises an error if dish isnt on the menu' do 
    allow(menu).to receive(:has_dish?).with(:beef).and_return false
    expect { order.add(:beef, 2) }.to raise_error NoItemError, 'Beef not on the menu!'
  end

end