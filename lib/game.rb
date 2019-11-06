# La librería utils maneja el control de input del usuario.
# Esto permite que la captura del input no detenga el juego mientras espera respuesta.
require_relative 'utils'
require_relative 'ship'
require_relative 'tablero'
require_relative 'meteorite1x1'

class Game
  def self.start
    game = Game.new
    game.update
  end

  def initialize
    @frames = 0
    @fps = 20 # cantidad de frames por segundo
    @ship = Ship.new
    @tablero = Tablero.new
    @array1x1 = []
    @score = 0
  end

  def update
    @tablero.init_ship(@ship)
    loop do
      @frames += 1 # Cantidad de frame desde que el juego comenzó (puede ser útil... o ¡no!)
      draw
      handle_input # manejo de la la entrada del jugador
        if @frames % 3 == 0 then
          @array1x1 << Meteorite1x1.new(@frames,@tablero)
          @array1x1.each do
            |x|
            x.advance(@tablero,@frames,@array1x1)
          end
        end  
        # colition_validator(@tablero.tablero,@ship.shape)
        if @tablero.tablero[19].find_index {|x| x == @ship.shape} == nil then
          game_over
        end
        #sumar el score
        @score = @score + @tablero.tablero[20].count {|x| x == ' O ' } 



      sleep 1.0 / @fps # tiempo de refrescamiento, frecuencia 10 Hz
      break if @frames == @fps * 60 
    end
    if @frames == @fps * 60
      game_win
    end
  end

  def handle_input
    key = Utils.get_key&.chr # Se captura la entrada de jugador
    case key
    when 'a'
      @ship.move_left(@tablero)
    when 'd'
      @ship.move_right(@tablero)
    when 'b'
      puts 'Boooooooommmmmmm!!!!!!'
      puts 'Has lanzado una bomba espacial BX-2603, todo a tu alrededor queda destruido...'
      sleep(1)
      @array1x1=Array.new
      @tablero = Tablero.new
      @ship = Ship.new
      @tablero.init_ship(@ship)
    when 'x'
      game_over
    when  'p'
      game_win
    end
  end

  # def colition_validator(@tablero.tablero,@ship.shape)
  #   if @tablero.tablero[19].find_index {|x| x == @ship.shape} == nil then
  #     game_over
  #   end
  # end

  def game_over
    system 'clear'
    puts "¡Has perdido!"
    puts "Score: #{@score}"
    puts
    puts "Has logrado eyectarte a ultimo segundo.... La tripulacion de SpaceHack puso todas sus esperanzas en tus habilidades como piloto"
    puts " y los has estrellado contra un meteorito... por lo menos estas vivo y algo sabes programar... espero puedas dormir tranquilo.... o no"
    puts
    puts
    puts
    puts
    puts
    raise StopIteration
  end

  def game_win
    system("clear")
    puts '¡Has ganado!'
    puts "Score: #{@score}"
    puts
    puts "Has logrado sortear con gran habilidad la lluvia de meteoritos.... La tripulacion de SpaceHack hizo bien en poner todas sus esperanzas"
    puts "en ti como piloto, todos celebran, recibes una medalla por parte de los mentores a cargo de SpaceHack, mientras suena una cancion epica" 
    puts
    puts "Juca, esta mas tranquilo, ya sabes algo de programacion estructurada"
    puts "mientras... Carlos, el Profe, Anderson y Roberto miran sonrientes, al parecer ya sabes programar... o no"
    puts
    puts
    puts
    puts
    puts
    raise StopIteration
  end

  def draw
    system 'clear'
    puts "Frames: #{@frames}"
    puts "Score: #{@score}"
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
end