require_relative 'tablero'

class Meteorite2x2 
    
    def initialize(frames,tablero)
        @shape = ' U '
        @foto = frames

        @type = rand(4)

        if @type == 0 then
            @column0 = 0
            @column1 = 1
            @row0 = 0
            @row1 = 1
        end

        if @type == 1 then
            @column0 = 5
            @column1 = 6
            @row0 = 0
            @row1 = 1
        end

        if @type == 2 then
            @column0 = 10
            @column1 = 11
            @row0 = 0
            @row1 = 1
        end

        if @type == 3 then
            @column0 = 13
            @column1 = 14
            @row0 = 0
            @row1 = 1
        end

     
        # tablero.tablero[@row][@column] = @shape
    end

    def advance2x2(tablero,frames,array)
        tablero.tablero[@row0][@column0] = @shape
        tablero.tablero[@row0][@column1] = @shape
        tablero.tablero[@row1][@column0] = @shape
        tablero.tablero[@row1][@column1] = @shape

                if @row1 == 20 then
                    @shape = '   '
                    tablero.tablero[@row0][@column0] = '   '
                    tablero.tablero[@row0][@column1] = '   '
                    tablero.tablero[@row1][@column0] = '   '
                    tablero.tablero[@row1][@column1] = '   '
                    @column0 = 0
                    @column1 = 0
                    @row0 = 20
                    @row1 = 20

                end
                if @row1 < 20 then
                    tablero.tablero[@row0][@column0] = '   '
                    tablero.tablero[@row0][@column1] = '   '
                    tablero.tablero[@row1][@column0] = '   '
                    tablero.tablero[@row1][@column1] = '   '
                    @row0 = @row0 +1
                    @row1 = @row1 +1
                    tablero.tablero[@row0][@column0] = @shape
                    tablero.tablero[@row0][@column1] = @shape
                    tablero.tablero[@row1][@column0] = @shape
                    tablero.tablero[@row1][@column1] = @shape
                end
    end
end

