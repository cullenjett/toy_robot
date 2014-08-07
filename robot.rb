class Robot
  attr_accessor :x, :y, :facing, :position

  def place(x, y, facing)
    self.position = { x: x, y: y, facing: facing } if valid_placement?(x, y, facing)
  end

  def move
    @move_successful = nil
    
    case position[:facing]
      when 'NORTH'
        if position[:y] < 5
          position[:y] += 1
          @move_successful = true
        else
          invalid_move
          @move_successful = false
        end
      when 'SOUTH'
        if position[:y] > 1
          position[:y] -= 1
          @move_successful = true
        else
          invalid_move
          @move_successful = false
        end
      when 'EAST'
        if position[:x] < 5
          @move_successful = true
          position[:x] += 1
        else
          invalid_move
          @move_successful = false
        end
      when 'WEST'
        if position[:x] > 1
          @move_successful = true
          position[:x] -= 1
        else
          invalid_move
          @move_successful = false
        end
    end
  end

  def turn_left
    case position[:facing]
      when 'NORTH'
        position[:facing] = 'WEST'
      when 'SOUTH'
        position[:facing] = 'EAST'
      when 'EAST'
        position[:facing] = 'NORTH'
      when 'WEST'
        position[:facing] = 'SOUTH'
    end
  end

  def turn_right
    case position[:facing]
      when 'NORTH'
        position[:facing] = 'EAST'
      when 'SOUTH'
        position[:facing] = 'WEST'
      when 'EAST'
        position[:facing] = 'SOUTH'
      when 'WEST'
        position[:facing] = 'NORTH'
    end
  end

  def valid_move?
    @move_successful
  end

  def report
    puts ''
    puts "=> The robot is at the coordinates (#{position[:x]}, #{position[:y]}) and is facing #{position[:facing]}"
    puts ''
  end

  private

  def valid_placement?(x, y, facing)
    (x >= 1 && x <= 5 && y >= 1 && y <= 5 && ['NORTH', 'SOUTH', 'EAST', 'WEST'].include?(facing))
  end

  def invalid_move
    puts ''
    puts "*** The robot can't move in that direction or it will fall off the table! ***"
    puts ''
  end
end
