require './robot.rb'

class ToyRobot
  attr_accessor :robot

  def initialize
    self.robot = Robot.new
  end

  def welcome
    puts ''
    puts "***********************"
    puts "* TOY ROBOT CHALLENGE *"
    puts "***********************"
    puts ''
  end

  def explain_rules
    puts "You are now in control a robot on a 5x5 grid."
  end

  def set_robot
    puts ''
    puts "=> Where would you like to place your robot? ex: 2, 3, NORTH (no parenthesis, spaces optional)"
    player_input = gets.chomp.upcase.split(',').each(&:strip!)
    x_pos = player_input[0].to_i
    y_pos = player_input[1].to_i
    direction = player_input[2].to_s
    if robot.place(x_pos, y_pos, direction)
      robot.report
    else
      puts ''
      puts "Oops, make sure you use coordinates between 1 and 5 and use NORTH, SOUTH, EAST, or WEST."
      puts "Don't forget to put commas between the arguments."
      set_robot
    end
  end

  def play_with_robot
    puts "=> What's your next move? (LEFT, RIGHT, MOVE, REPORT, PLACE, QUIT)"
    response = gets.chomp.upcase

    while response != "QUIT"
      case response
      when "LEFT"
        robot.turn_left
        describe_action('LEFT')
      when "RIGHT"
        robot.turn_right
        describe_action('RIGHT')
      when "MOVE"
        robot.move
        describe_action('MOVE') if robot.valid_move?
      when "REPORT"
        robot.report
      when "PLACE"
        set_robot
      else
        puts "Sorry, I only know how to response to LEFT, RIGHT, MOVE, REPORT, or QUIT"
      end

      puts "=> What's your next move? (LEFT, RIGHT, MOVE, REPORT, QUIT)"
      response = gets.chomp.upcase
    end
  end

  def describe_action(action)
    puts ''
    if action == 'LEFT' || action == 'RIGHT'
      puts "The robot turns #{action}"
    else
      puts "The robot moves one space forward"
    end
    puts ''
  end

  def start
    welcome
    explain_rules
    set_robot
    play_with_robot
  end
end #ToyRobotChallenge

game = ToyRobot.new
game.start
