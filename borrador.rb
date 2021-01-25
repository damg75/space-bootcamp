#get keypressed
def get_key_pressed
	system("stty raw -echo")
	t = STDIN.getc
	system("stty -raw echo")
	return t.downcase
end

class Ship
    attr_reader :position_ship, :shape
    def initialize
        @shape = ' A '
        @last_position_ship = 7
        @position_ship = @last_position_ship
    end
    def move_right(tablero)
        tablero[19][tablero[19].find_index {|x| x == ' A '}] = ' _ '
        if @position_ship == 14 then
            @position_ship = 14
            tablero[19][@position_ship] = @shape
        else
            @position_ship = @position_ship + 1
            tablero[19][@position_ship] = @shape
        end

    end
    def move_left(tablero)
        tablero[19][tablero[19].find_index {|x| x == ' A '}] = ' _ '
        if @position_ship == 0 then
            @position_ship = 0
            tablero[19][@position_ship] = @shape
        else
            @position_ship = @position_ship -1
            tablero[19][@position_ship] = @shape
        end
    end
end


def tablero_f
    tablero = []
    for i in 0..19 do
      tablero[i] = []
      for j in 0..14 do
        tablero[i][j] = ' _ '
      end
    end
 return tablero
end    

tablero = tablero_f
ship = Ship.new
tablero[19][ship.position_ship] = ship.shape


def p_t(tablero)
    puts " "
    puts " "
    tablero.each do
        |x|
        print x
        puts " "
    end
end
loop do
    system("clear")
    p_t(tablero)
    mover = get_key_pressed
    case mover
        when 'd'
            ship.move_right(tablero)
        when 'a'
            ship.move_left(tablero)
    end
    break if mover == 'x'
end




