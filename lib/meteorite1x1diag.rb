# require_relative 'tablero'

class Meteorite1x1diag

    def initialize

        @izq_o_der = rand(2)

        if @izq_o_der == 1 then 
            @column = 14
            @row = rand(6..11)
            @shape = ' X '
        end
        if @izq_o_der == 0 then
            @column = 0
            @row = @row = rand(6..11)
            @shape = ' Y '
        end 

    end

    def advancediag(tablero)

        tablero.tablero[@row][@column] = @shape

        if @izq_o_der == 1 then
            if @row == 20 then
                @shape = '   '
                tablero.tablero[@row][@column] = @shape
            end
            if @row < 20 then
                tablero.tablero[@row][@column] = '   '
                @row = @row +1
                @column = @column -1
                tablero.tablero[@row][@column] = @shape
            end
        end

        if @izq_o_der == 0 then
            if @row == 20 then
                @shape = '   '
                tablero.tablero[@row][@column] = @shape
            end
            if @row < 20 then
                tablero.tablero[@row][@column] = '   '
                @row = @row +1
                @column = @column +1
                tablero.tablero[@row][@column] = @shape
            end
        end

    end

end



