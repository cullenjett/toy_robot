require './robot.rb'
require './game.rb'

RSpec.describe Robot do
  describe "#place" do
    let(:robot) { Robot.new }

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
      robot = Robot.new
      robot.place(1, 1, 'NORTH')
      robot.move
      expect(robot.position).to eq({ x:1, y:2, facing: 'NORTH' })
    end

    it "does not move the robot if it would cause the robot to fall off the table" do
      robot = Robot.new
      robot.place(1, 1, 'SOUTH')
      robot.move
      expect(robot.position).to eq({ x:1, y:1, facing: 'SOUTH' })
    end
  end #move

  describe "#left" do
    it "changes the robot's direction 1/4 turn counter-clockwise" do
      robot = Robot.new
      robot.place(1, 1, 'NORTH')
      robot.turn_left
      expect(robot.position[:facing]).to eq('WEST')
    end
  end #left
end #Robot
