require_relative '../lib/elevator'

describe Elevator do
  let(:elevator) { Elevator.new }

  it 'should have a default floor of 0' do
    expect(elevator.floor).to eq 0
  end

  it 'should set the provided floor when instantiated' do
    expect(Elevator.new(floor: 5).floor).to eq 5
  end

  # Change xit to it when you're ready to make this spec pass
  xit 'should go to the floor' do
    elevator.go_to floor: 3
    expect(elevator.floor).to eq 3
  end
end
