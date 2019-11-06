require_relative 'tablero'

class Meteorite1x1 
    
    # attr_reader :column, :row

    def initialize(frames,tablero)
        @shape = ' O '
        @foto = frames
        # if frames < 600
        #     @column = rand(15)
        # end
        # if frames > 600
        #     @column = rand(10)
        # end
        @column = rand(15)
        @row = 0
        
        # tablero.tablero[@row][@column] = @shape
    end

    def advance(tablero,frames,array)
        tablero.tablero[@row][@column] = @shape
        # if @foto < frames then
                if @row == 20 then
                    @shape = '   '
                    tablero.tablero[@row][@column] = @shape
                end
                if @row < 20 then
                    tablero.tablero[@row][@column] = '   '
                    @row = @row +1
                    tablero.tablero[@row][@column] = @shape
                end
        # end
    end
end


