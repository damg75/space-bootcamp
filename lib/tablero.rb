require_relative 'ship'

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
    # @tablero.each do
    #     |x|
    #     print x
    #     puts " "
    #     end
    # end

    for i in 0..20 do
        print "                     []".colorize(:blue)
        for j in 0..14 do
            if @tablero[i][j] == ship.shape then
                print "#{@tablero[i][j].colorize(:yellow)}"
            else
                print "#{@tablero[i][j].colorize(:light_blue)}"
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

    # def meteorizador1x1(meteorito)
    #     array1x1 << meteorito
    #     array1x1.each do {|x| @tablero[] }
        

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