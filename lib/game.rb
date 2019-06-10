require_relative 'utils'

class Game

  def self.start
    game = Game.new
    game.update
  end

  def initialize
    @frames = 0
    @fps = 10
  end

  def update
    loop do
      @frames += 1
      handle_input
      sleep 1.0 / @fps
    end
  end

  def handle_input
    key = Utils.get_key&.chr
    case key
    when 'a'
      #move :left
    when 'd'
      #move :right
    when 'x'
      game over
    end
  end

  def game_over
    system 'clear'
    raise StopIteration
  end
end