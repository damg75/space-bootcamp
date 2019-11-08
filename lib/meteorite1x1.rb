# require_relative 'tablero'

class Meteorite1x1 
    
    def initialize
        @shape = ' O '
        @column = rand(15)
        @row = 0
    end

    def advance(tablero)
        tablero.tablero[@row][@column] = @shape
        if @row == 20 then
            @shape = '   '
            tablero.tablero[@row][@column] = @shape
        end
        if @row < 20 then
            tablero.tablero[@row][@column] = '   '
            @row = @row +1
            tablero.tablero[@row][@column] = @shape
        end
    end

end


