require_relative '../lib/elevator_system'
require_relative '../lib/elevator'

describe ElevatorSystem do
  context 'without elevators' do
    let(:elevator_system) { ElevatorSystem.new(20) }

    # Change xit to it when you're ready to make this spec pass
    xit 'should know how many floors there are' do
      expect(elevator_system.floors).to eq 20
    end

    xit 'should have no elevators by default' do
      expect(elevator_system.elevator_count).to eq 0
    end

    xit 'should be possible to add elevators to the system' do
      elevator_system.add_elevator(Elevator.new)
      expect(elevator_system.elevator_count).to eq 1
    end

    xit 'should not be possible to request an elevator' do
      expect do
        elevator_system.request(2)
      end.to raise_error(ElevatorSystem::NoElevators)
    end
  end

  context 'with elevators' do
    let(:elevator_1) { Elevator.new(0) }
    let(:elevator_2) { Elevator.new(10) }
    let(:elevator_3) { Elevator.new(15) }
    let(:elevator_system) do
      elevator_system = ElevatorSystem.new(20)
      elevator_system.add_elevator elevator_1
      elevator_system.add_elevator elevator_2
      elevator_system.add_elevator elevator_3
      elevator_system
    end

    xit 'should send the closest elevator to the requested floor' do
      elevator_system.request 4
      expect(elevator_1.floor).to eq 4
      expect(elevator_2.floor).to eq 10
      expect(elevator_3.floor).to eq 15

      elevator_system.request 12
      expect(elevator_1.floor).to eq 4
      expect(elevator_2.floor).to eq 12
      expect(elevator_3.floor).to eq 15

      elevator_system.request 7
      expect(elevator_1.floor).to eq 7
      expect(elevator_2.floor).to eq 12
      expect(elevator_3.floor).to eq 15
    end
  end
end

