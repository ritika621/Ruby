require_relative '../models/game_board'
require_relative '../models/ship'
require_relative '../models/position'

# return a populated GameBoard or nil
# Return nil on any error (validation error or file opening error)# If 5 valid ships added, return GameBoard; return nil otherwise
def read_ships_file(path)
  gameBoard= GameBoard.new 10, 10
  
  position = Array.new
  count = 0
 if read_file_lines(path) == false
   return nil
  end
       regExpr = /^\((\d+),(\d+)\), (Left|Up|Right|Down), (\d+)$/
       read_file_lines(path){|line|
         format = regExpr.match(line)
         if format
           if count < 5 
       position = Position.new(format[1].to_i, format[2].to_i)
       shp = Ship.new(position, format[3], format[4].to_i)
     if format[4].to_i > 0 || format[4].to_i  < 6
       if gameBoard.add_ship(shp) == false
         return nil
       end
       
           
         count += 1
     end
     end
           
     end
          
       }
       
       if count != 5
         return nil
    
  end
  gameBoard

end


# return Array of Position or nil
# Returns nil on file open error
def read_attacks_file(path)
  positionArray = Array.new
  
  regExpr = /^\((\d+),(\d+)\)$/
  if read_file_lines(path) == nil
    return nil
  end
    read_file_lines(path){|line|
      format = regExpr.match(line)
      if format 
        position = Position.new(format[1].to_i, format[2].to_i)
        positionArray.push(position)
      end
    }
  
    return positionArray

end


# ===========================================
# =====DON'T modify the following code=======
# ===========================================
# Use this code for reading files
# Pass a code block that would accept a file line
# and does something with it
# Returns True on successfully opening the file
# Returns False if file doesn't exist
def read_file_lines(path)
    return false unless File.exist? path
    if block_given?
        File.open(path).each do |line|
            yield line
        end
    end

    true
end
