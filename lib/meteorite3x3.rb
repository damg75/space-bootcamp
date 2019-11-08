# require_relative 'tablero'

class Meteorite3x3 
    
    def initialize

        @shape = ' V '
        @type = rand(2)

        if @type == 0 then

            @column0 = 2
            @column1 = 3
            @column2 = 4
            @row0 = 0
            @row1 = 1
            @row2 = 2

        end

        if @type == 1 then

            @column0 = 7
            @column1 = 8
            @column2 = 9
            @row0 = 0
            @row1 = 1
            @row2 = 2

        end

    end

    def advance3x3(tablero)

        tablero.tablero[@row0][@column0] = @shape
        tablero.tablero[@row0][@column1] = @shape
        tablero.tablero[@row0][@column2] = @shape
        tablero.tablero[@row1][@column0] = @shape
        tablero.tablero[@row1][@column1] = @shape
        tablero.tablero[@row1][@column2] = @shape
        tablero.tablero[@row2][@column0] = @shape
        tablero.tablero[@row2][@column1] = @shape
        tablero.tablero[@row2][@column2] = @shape


        if @row2 == 20 then

            @shape = '   '
            tablero.tablero[@row0][@column0] = '   '
            tablero.tablero[@row0][@column1] = '   '
            tablero.tablero[@row0][@column2] = '   '
            tablero.tablero[@row1][@column0] = '   '
            tablero.tablero[@row1][@column1] = '   '
            tablero.tablero[@row1][@column2] = '   '
            tablero.tablero[@row2][@column0] = '   '
            tablero.tablero[@row2][@column1] = '   '
            tablero.tablero[@row2][@column2] = '   '
            @column0 = 0
            @column1 = 0
            @column2 = 0
            @row0 = 20
            @row1 = 20
            @row2 = 20

        end
        if @row2 < 20 then

            tablero.tablero[@row0][@column0] = '   '
            tablero.tablero[@row0][@column1] = '   '
            tablero.tablero[@row0][@column2] = '   '
            tablero.tablero[@row1][@column0] = '   '
            tablero.tablero[@row1][@column1] = '   '
            tablero.tablero[@row1][@column2] = '   '
            tablero.tablero[@row2][@column0] = '   '
            tablero.tablero[@row2][@column1] = '   '
            tablero.tablero[@row2][@column2] = '   '
            @row0 = @row0 +1
            @row1 = @row1 +1
            @row2 = @row2 +1
            tablero.tablero[@row0][@column0] = @shape
            tablero.tablero[@row0][@column1] = @shape
            tablero.tablero[@row0][@column2] = @shape
            tablero.tablero[@row1][@column0] = @shape
            tablero.tablero[@row1][@column1] = @shape
            tablero.tablero[@row1][@column2] = @shape
            tablero.tablero[@row2][@column0] = @shape
            tablero.tablero[@row2][@column1] = @shape
            tablero.tablero[@row2][@column2] = @shape
            
        end

    end

end
