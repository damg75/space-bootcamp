require_relative 'tablero'
require 'colorize'

class Ship
    attr_reader :position_ship, :shape
    def initialize
        @shape = ' A '
        @last_position_ship = 7
        @position_ship = @last_position_ship
    end
    def move_right(tablero)
        tablero.tablero[19][tablero.tablero[19].find_index {|x| x == ' A '}] = '   '
        if @position_ship == 14 then
            @position_ship = 14
            tablero.tablero[19][@position_ship] = @shape
        else
            @position_ship = @position_ship + 1
            tablero.tablero[19][@position_ship] = @shape
        end

    end
    def move_left(tablero)
        tablero.tablero[19][tablero.tablero[19].find_index {|x| x == ' A '}] = '   '
        if @position_ship == 0 then
            @position_ship = 0
            tablero.tablero[19][@position_ship] = @shape
        else
            @position_ship = @position_ship -1
            tablero.tablero[19][@position_ship] = @shape
        end
    end

    # def bomb(tablero,array)
    #     # for i in 0..20 do
    #     #     for j in 0..14 do
    #     #         if tablero.tablero[i][j] != ' A ' then
    #     #             tablero.tablero[i][j] = '   '
    #     #         end
    #     #         puts 'bomba!!!!'
    #     #     end
    #     # end
    #     array=Array.new()

    # end
end