require './robot.rb'

RSpec.describe Robot do
  let(:robot) { Robot.new }

  describe "#place" do
    it "places the robot at the given x,y coordinate" do
      robot.place(1, 1, 'NORTH')
      expect(robot.position).to eq({ x:1, y:1, facing: 'NORTH' })
    end

    it "does not place the robot if the coordinate given is greater than 5" do
      robot.place(2, 2, 'NORTH')
      robot.place(7, 11, 'NORTH')
      expect(robot.position).to eq({ x:2, y:2, facing: 'NORTH' })
    end

    it "does not place the robot if the coordinate given is negative" do
      robot.place(2, 2, 'NORTH')
      robot.place(-1, -1, 'NORTH')
      expect(robot.position).to eq({ x:2, y:2, facing: 'NORTH' })
    end
  end #place


  describe "#move" do
    it "moves the robot one unit in the direction it is facing" do
      robot.place(1, 1, 'NORTH')
      robot.move
      expect(robot.position).to eq({ x:1, y:2, facing: 'NORTH' })
    end

    it "does not move the robot if it would cause the robot to fall off the table" do
      robot.place(1, 1, 'SOUTH')
      robot.move
      expect(robot.position).to eq({ x:1, y:1, facing: 'SOUTH' })
    end
  end #move

  describe "#left" do
    it "changes the robot's direction 1/4 turn counter-clockwise" do
      robot.place(1, 1, 'NORTH')
      robot.turn_left
      expect(robot.position[:facing]).to eq('WEST')
    end
  end #left

  describe "#valid_move?" do
    it "returns true if #move does not make the robot fall off the table" do
      robot.place(1, 1, 'NORTH')
      robot.move
      expect(robot.valid_move?).to be true
    end

    it "returns false if #move will make the robot fall off the table" do
      robot.place(5, 5, 'NORTH')
      robot.move
      expect(robot.valid_move?).to be false
    end
  end
end #Robot
