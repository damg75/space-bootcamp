# La librería utils maneja el control de input del usuario.
# Esto permite que la captura del input no detenga el juego mientras espera respuesta.
require_relative 'utils'
require_relative 'ship'
require_relative 'tablero'

class Game
  def self.start
    game = Game.new
    game.update
  end

  def initialize
    @frames = 0
    @fps = 30 # cantidad de frames por segundo
    @ship = Ship.new
    @tablero = Tablero.new
  end

  def update
    @tablero.init_ship(@ship)
    loop do
      @frames += 1 # Cantidad de frame desde que el juego comenzó (puede ser útil... o ¡no!)
      draw
      handle_input # manejo de la la entrada del jugador
      # @tablero.asteroide1x1(@frames,@fps)
      sleep 1.0 / @fps # tiempo de refrescamiento, frecuencia 10 Hz
      break if @frames == 18000
    end
    game_win
  end

  def handle_input
    key = Utils.get_key&.chr # Se captura la entrada de jugador
    case key
    when 'a'
      @ship.move_left(@tablero)
    when 'd'
      @ship.move_right(@tablero)
    when 'x'
      game_over
    end
  end

  def game_over
    system 'clear'
    puts "¡Perdiste!"
    raise StopIteration
  end

  def game_win
    system("clear")
    puts '¡Has ganado!'
    raise StopIteration
  end

  def draw
    system 'clear'
    puts "Frames: #{@frames}"
    puts 
    puts 
    @tablero.p_t
    puts 
    puts 
    show_menu
    puts 
  end

  # Propuesta de menú
  def show_menu
    puts '                                  ##################################'
    puts '                                  d: derecha, a: izquierda, x: salir'
    puts '                                  ##################################'
  end

#   def p_t(@tablero)
#     puts 
#     puts 
#     @tablero.each do
#         |x|
#         print x
#         puts 
#     end
# end
end