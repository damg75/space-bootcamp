require_relative 'ship'

class Tablero
    def initialize
        @tablero = []
        for i in 0..19 do
        @tablero[i] = []
            for j in 0..14 do
            @tablero[i][j] = '   '
            end
        end
    end
   
    def p_t
     puts 
     puts 
    @tablero.each do
        |x|
        print x
        puts " "
        end
    end

    def init_ship(ship)
        @tablero[19][ship.position_ship] = ship.shape
    end
    def tablero
        @tablero
    end

    # def asteroide1x1(frames,fps)

    #     if frames % 20 == 0 then
    #         asteroid_column = rand(14)
    #         @tablero[0][asteroid_column] = ' 0 '
    #         i = 1
    #         foto = frames
    #         met = true
    #     end
        

    #     if foto < frames then
    #         @tablero[i-1][asteroid_column] = '   '
    #         @tablero[i][asteroid_column] = ' 0 '
    #         i += 1
    #         if i == 19 then
    #             i = 0
    #             met = 0
    #         end
                
    #     end


    # end

end

# for i in 0..14 do
#     print "\n\n\t\t  "
#     for j in 0..19 do
#         while @tablero[i][j] != ' A '
#             print "#{@tablero[i][j]}"
#         end
#     end
# end   

# @tablero.each do
#     |x|
#     print x
#     puts " "
#     end

# for i in 0..19 do
#     for j in 0..14 do
#         print @tablero[i][j]
#     end
# end

# puts "#{@tablero[19][0]} #{@tablero[19][1]} #{@tablero[19][2]} #{@tablero[19][3]} #{@tablero[19][4]} #{@tablero[19][5]} #{@tablero[19][6]} #{@tablero[19][7]} #{@tablero[19][8]} #{@tablero[19][9]} "

# for i in 0..19 do
#     for j in 0..14 do
#         print @tablero[i][j]
#     end
#     puts
# end