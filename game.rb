require './robot.rb'

class ToyRobotChallenge
  attr_accessor :robot

  def initialize
    self.robot = Robot.new
  end

  def welcome
    puts "***********************"
    puts "* TOY ROBOT CHALLENGE *"
    puts "***********************"
    puts ''
  end

  def explain_rules
  end

  def set_robot
    puts "Where would you like to place your robot? EXAMPLE: 2, 3, NORTH"
    player_input = gets.chomp.split(',').each(&:strip!)
    x_pos = player_input[0].to_i
    y_pos = player_input[1].to_i
    direction = player_input[2].to_s
    robot.place(x_pos, y_pos, direction)
    robot.report
  end

  def play_with_robot
    puts "What's your next move? (LEFT, RIGHT, MOVE, REPORT, QUIT)"
    response = gets.chomp

    while response != "QUIT"
      case response
      when "LEFT"
        robot.turn_left
      when "RIGHT"
        robot.turn_right
      when "MOVE"
        robot.move
      when "REPORT"
        robot.report
      else
        puts "Sorry, I only know how to response to LEFT, RIGHT, MOVE, REPORT, or QUIT"
      end

      puts "What's your next move? (LEFT, RIGHT, MOVE, REPORT, QUIT)"
      response = gets.chomp
    end
  end

  def start
    welcome
    explain_rules
    set_robot
    play_with_robot
  end
end #ToyRobotChallenge

game = ToyRobotChallenge.new
game.start
