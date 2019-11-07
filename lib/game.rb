# La librería utils maneja el control de input del usuario.
# Esto permite que la captura del input no detenga el juego mientras espera respuesta.
require_relative 'utils'
require_relative 'ship'
require_relative 'tablero'
require_relative 'meteorite1x1'
require_relative './meteorite1x1diag'
require_relative 'meteorite2x2'
require_relative 'meteorite3x3'
require 'colorize'

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
    @array1x1diag = []
    @array2x2 = []
    @array3x3 = []
    @score = 0
    @tiempo = 0
  end

  def update
    @tablero.init_ship(@ship)
    loop do
      @frames += 1 # Cantidad de frame desde que el juego comenzó (puede ser útil... o ¡no!)
      @tiempo = @frames / @fps
      draw
      handle_input # manejo de la la entrada del jugador
      asteroid1x1
      asteroid1x1diag
      asteroid2x2
      asteroid3x3
      colition_validator
      score_sum
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
      ship_move_left
    when 'd'
      ship_move_right
    when 'b'
      drop_bomb
    when 'x'
      game_over
    when  'p'
      game_win
    end
  end

  def game_over
    # system 'clear'
    puts "¡Has perdido!".colorize(:yellow)
    puts "Tiempo: #{@tiempo} s".colorize(:yellow)
    puts "Score: #{@score}".colorize(:yellow)
    puts
    puts "Has logrado eyectarte al ultimo segundo.... La tripulacion de SpaceHack puso todas sus esperanzas en tus habilidades como piloto....".colorize(:yellow)
    sleep(3)
    puts
    puts " y los has estrellado contra un meteorito... por lo menos estas vivo y algo sabes programar... espero puedas dormir tranquilo.... o no".colorize(:yellow)
    puts
    puts
    puts
    puts
    puts
    raise StopIteration
  end

  def game_win
    system("clear")
    puts '¡Has ganado!'.colorize(:yellow)
    puts "Tiempo: #{@tiempo} s".colorize(:yellow)
    puts "Score: #{@score}".colorize(:yellow)
    puts
    puts "Has logrado sortear con gran habilidad el cinturon de asteroides y la nave pudo llegar a Gliese 581g....".colorize(:yellow)
    sleep(5)
    puts
    puts "La tripulacion de SpaceHack hizo bien en poner todas sus esperanzas".colorize(:yellow)
    puts "en ti como piloto, todos celebran, recibes una medalla por parte de los mentores a cargo de SpaceHack, mientras suena una cancion epica".colorize(:yellow) 
    sleep(5)
    puts
    puts "Juca, esta mas tranquilo, ya sabes algo de programacion estructurada".colorize(:yellow)
    puts "mientras... Carlos, el Profe, Anderson y Roberto miran sonrientes, al parecer ya sabes programar... o no".colorize(:yellow)
    puts
    puts
    puts
    puts
    puts
    raise StopIteration
  end

  def draw
    system 'clear'
    puts
    puts '          ███████╗██████╗  █████╗  ██████╗███████╗██╗  ██╗ █████╗  ██████╗██╗  ██╗
          ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝
          ███████╗██████╔╝███████║██║     █████╗  ███████║███████║██║     █████╔╝ 
          ╚════██║██╔═══╝ ██╔══██║██║     ██╔══╝  ██╔══██║██╔══██║██║     ██╔═██╗ 
          ███████║██║     ██║  ██║╚██████╗███████╗██║  ██║██║  ██║╚██████╗██║  ██╗
          ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝'.colorize(:yellow)
    
    puts
    puts "Tiempo: #{@tiempo} s".colorize(:yellow)
    puts "Score: #{@score}".colorize(:yellow)
    puts 
    puts
    puts "                     **--*--*--*--*--*--*--*---*--*--*--*--*--*--*--**".colorize(:blue) 
    @tablero.p_t(@ship)
    puts "                     **--*--*--*--*--*--*--*---*--*--*--*--*--*--*--**".colorize(:blue)
    puts 
    puts 
    show_menu
    puts 
  end

  # Propuesta de menú
  def show_menu
    puts '                             =================================='.colorize(:yellow)
    puts '                             d: derecha, a: izquierda, x: salir'.colorize(:yellow)
    puts '                             =================================='.colorize(:yellow)
    puts '                                           b: bomba            '.colorize(:yellow)
    puts '                             =================================='.colorize(:yellow)
  end

  def asteroid1x1
    if @frames < (@fps * 60) / 6
      if @frames % 10 == 0 then
        @array1x1 << Meteorite1x1.new(@frames,@tablero)
        @array1x1.each do
          |x|
          x.advance(@tablero,@frames,@array1x1)
        end
      end 
    end
    if @frames < (@fps * 60) / 3  && @frames >= (@fps * 60) / 6
      if @frames % 5 == 0 then
        @array1x1 << Meteorite1x1.new(@frames,@tablero)
        @array1x1.each do
          |x|
          x.advance(@tablero,@frames,@array1x1)
        end
      end 
    end
    if @frames < (@fps * 60) / 2 && @frames >= (@fps * 60) / 3
      if @frames % 4 == 0 then
        @array1x1 << Meteorite1x1.new(@frames,@tablero)
        @array1x1.each do
          |x|
          x.advance(@tablero,@frames,@array1x1)
        end
      end 
    end
    if @frames < (@fps * 60) / 2 + (@fps * 60) / 6 && @frames >= (@fps * 60) / 2
      if @frames % 3 == 0 then
        @array1x1 << Meteorite1x1.new(@frames,@tablero)
        @array1x1.each do
          |x|
          x.advance(@tablero,@frames,@array1x1)
        end
      end 
    end
    if @frames < (@fps * 60) / 2 + (@fps * 60) / 3 && @frames >= (@fps * 60) / 2 + (@fps * 60) / 6
      if @frames % 2 == 0 then
        @array1x1 << Meteorite1x1.new(@frames,@tablero)
        @array1x1.each do
          |x|
          x.advance(@tablero,@frames,@array1x1)
        end
      end 
    end
    if @frames < @fps * 60 && @frames >= (@fps * 60) / 2 + (@fps * 60) / 3
      if @frames % 2 == 0 then
        @array1x1 << Meteorite1x1.new(@frames,@tablero)
        @array1x1.each do
          |x|
          x.advance(@tablero,@frames,@array1x1)
        end
      end 
    end
  end

  def colition_validator
    if @tablero.tablero[19].find_index {|x| x == @ship.shape} == nil then
      draw
      game_over
    end
  end

  def score_sum
    @score = @score + @tablero.tablero[20].count {|x| x == ' O ' }
    @score = @score + (@tablero.tablero[20].count {|x| x == ' X ' })
    @score = @score + (@tablero.tablero[20].count {|x| x == ' Y ' })
    @score = @score + (@tablero.tablero[20].count {|x| x == ' U ' })
    @score = @score + (@tablero.tablero[20].count {|x| x == ' V ' })
  end

  def drop_bomb
    system("clear")
    puts
      puts '  /\    '.colorize(:yellow)
      puts ' /  \   '.colorize(:yellow)
      puts ' |  |   '.colorize(:yellow)
      puts ' |  |   '.colorize(:yellow)
      puts '/ == \  '.colorize(:yellow)
      puts '|/**\|  '.colorize(:yellow)
      sleep(1)
      puts
      puts 'Boooooooommmmmmm!!!!!!'.colorize(:color => :yellow, :background => :red)
      puts 'Has lanzado una bomba espacial BX-2603, todo a tu alrededor queda destruido...'.colorize(:color => :yellow, :background => :red)
      puts
                puts '                               ________________
                ____/ (  (    )   )  \___
              /( (  (  )   _    ))  )   )\
            ((     (   )(    )  )   (   )  )
          ((/  ( _(   )   (   _) ) (  () )  )
          ( (  ( (_)   ((    (   )  .((_ ) .  )_
          ( (  )    (      (  )    )   ) . ) (   )
          (  (   (  (   ) (  _  ( _) ).  ) . ) ) ( )
          (_((__(_(__(( ( ( |  ) ) ) )_))__))_)___)
          ((__)        \\||lll|l||///          \_))
                  (   /(/ (  )  ) )\   )
                (    ( ( ( | | ) ) )\   )
              (        |(||(||)||||        )
                (     //|/l|||)|\\ \     )
              (/ / //  /|//||||\\  \ \  \ _)
          ------------------------------------------'.colorize(:color => :yellow, :background => :red)
      sleep(1)
      @array1x1 = Array.new
      @array1x1diag = Array.new
      @array2x2 = Array.new
      @array3x3 = Array.new
      @tablero = Tablero.new
      @tablero.init_ship(@ship)
  end  

  def ship_move_right
    @ship.move_right(@tablero)
  end

  def ship_move_left
    @ship.move_left(@tablero)
  end

  def asteroid1x1diag
    if @frames % 50 == 0 then
      @array1x1diag << Meteorite1x1diag.new(@frames,@tablero)
    end  
    if @frames % 10 == 0 then
      @array1x1diag.each do
        |x|
        x.advancediag(@tablero,@frames,@array1x1diag)
      end
    end 
  end

  def asteroid2x2
    if @frames % 100 == 0 then
      @array2x2 << Meteorite2x2.new(@frames,@tablero)
    end  
    if @frames % 10 == 0 then
      @array2x2.each do
        |x|
        x.advance2x2(@tablero,@frames,@array2x2)
      end
    end 
  end
  
  def asteroid3x3
    if @frames % 200 == 0 then
      @array3x3 << Meteorite3x3.new(@frames,@tablero)
    end  
    if @frames % 10 == 0 then
      @array3x3.each do
        |x|
        x.advance3x3(@tablero,@frames,@array3x3)
      end
    end 
  end


end