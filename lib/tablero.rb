# require_relative 'ship'

class Tablero

    def initialize
        
        @tablero = []
        for i in 0..20 do
        @tablero[i] = []
            for j in 0..14 do
            @tablero[i][j] = '   '
            end
        end
        
    end
   
    def p_t(ship)

        for i in 0..20 do
            print "                     []".colorize(:blue)
            for j in 0..14 do
                if @tablero[i][j] == ship.shape then
                    print "#{@tablero[i][j].colorize(:yellow)}"
                end
                if @tablero[i][j] == ' O ' then
                    print "#{@tablero[i][j].colorize(:light_blue)}"
                end
                if @tablero[i][j] == ' X ' || @tablero[i][j] == ' Y ' then
                    print "#{@tablero[i][j].colorize(:red)}"
                end
                if @tablero[i][j] == ' U ' then
                    print "#{@tablero[i][j].colorize(:yellow)}"
                end
                if @tablero[i][j] == ' V ' then
                    print "#{@tablero[i][j].colorize(:green)}"
                end
                if @tablero[i][j] == '   ' then
                    print "#{@tablero[i][j].colorize(:blue)}"
                end
            end
            puts "[]".colorize(:blue)
        end
    end

    def init_ship(ship)
        @tablero[19][ship.position_ship] = ship.shape
    end

    def tablero
        @tablero
    end

end

