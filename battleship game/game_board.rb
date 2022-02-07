class GameBoard
    attr_reader :max_row, :max_column

    def initialize(max_row, max_column)
        @max_row = max_row
        @max_column = max_column
        @board = Array.new(@max_row+1){Array.new(@max_column+1)}
        @attackBoard = Array.new(@max_row+1){Array.new(@max_column+1)}
    end

    # adds a Ship object to the GameBoard
    # returns Boolean
    # Returns true on successfully added the ship, false otherwise
    # Note that Position pair starts from 1 to max_row/max_column
    def add_ship(ship)
      i = 0
      count = 0
      returnVal = true
      if ship.start_position.row < 1 || ship.start_position.column < 1 || ship.start_position.row > @max_row || ship.start_position.column > @max_column
        returnVal = false
      else
      if ship.orientation == "Up"
        if ship.start_position.row - ship.size  + 1 < 1 
          returnVal = false
        else
          for i in 0..ship.size - 1
            if @board[ship.start_position.row-i][ship.start_position.column] == true
              returnVal = false
              end
end
        end
        if returnVal == true
          for i in 0..ship.size - 1 
           @board[ship.start_position.row - i][ship.start_position.column ] = true
            @attackBoard[ship.start_position.row - i][ship.start_position.column] = true
          end
        end
      end
      if ship.orientation == "Down"
        if ship.start_position.row + ship.size - 1 > @max_row
          returnval == false
        else
          for i in 0..ship.size - 1
            if @board[ship.start_position.row + i][ship.start_position.column] == true
              returnVal = false
            end
          end
          if returnVal == true
            for i in 0..ship.size - 1
              @board[ship.start_position.row + i][ship.start_position.column] = true
              @attackBoard[ship.start_position.row + i][ship.start_position.column] = true
            end
          end
        end
      end
      if ship.orientation == "Left"
        if ship.start_position.column - ship.size + 1 < 1 
          returnVal = false
        
      else
        for i in 0..ship.size - 1 
          if @board[ship.start_position.row][ship.start_position.column - i] == true
          returnVal = false
        end
        end
        if returnVal == true
          for i in 0..ship.size - 1
            @board[ship.start_position.row][ship.start_position.column - i] = true
            @attackBoard[ship.start_position.row][ship.start_position.column - i] = true
          end
        end
        end
      end
      if ship.orientation == "Right"
        if ship.start_position.column + ship.size - 1 > @max_column
          returnVal = false
        else
          for i in 0..ship.size - 1
            if @board[ship.start_position.row][ship.start_position.column + i] == true
              returnVal = false
            end
          end
          if returnVal == true
            for i in 0..ship.size - 1
              
              @board[ship.start_position.row][ship.start_position.column + i] = true
              @attackBoard[ship.start_position.row][ship.start_position.column + i] = true
        
            end
          end
        end
      end
      end

     
      
      #puts @attackBoard[ship.start_position.row][ship.start_position.column]
     returnVal
    end

    # return Boolean on whether attack was successful or not (hit a ship?)
    # return nil if Position is invalid (out of the boundary defined)
    def attack_pos(position)
returnVal = true
      if position.row < 1 || position.column < 1 || position.row > @max_row || position.column > @max_column
        returnVal = nil
      end
     
      if @board[position.row][position.column] == true || @attackBoard[position.row][position.column] == "attacked"
        
          @attackBoard[position.row][position.column] = "attacked"
        else
          returnVal = false
        end
        return returnVal
    end
        
        # check position

        # update your grid

        # return whether the attack was successful or not
       

    # Number of successful attacks made by the "opponent" on this player GameBoard
    def num_successful_attacks
      count = 0
      for i in 1..@max_row
        for j in 1..@max_column
          if @attackBoard[i][j] == "attacked"
            count += 1
          end
        end
        
      end
      count
    end

    # returns Boolean
    # returns True if all the ships are sunk.
    # Return false if at least one ship hasn't sunk.
            
        def all_sunk?
          returnVal = false
          ship_count = 0
          attack_count = 0
          for i in 1..@max_row
            for j in 1..@max_column
              if @board[i][j] == true
                ship_count += 1
              end
            end
          end
          for i in 1..@max_row
            for j in 1..@max_column
              if @attackBoard[i][j] == "attacked"

                attack_count += 1
              end
            end
          end
          if ship_count == attack_count
            returnVal = true
          end
          
          
          return returnVal
        end




    # String representation of GameBoard (optional but recommended)
    def to_s
        "STRING METHOD IS NOT IMPLEMENTED"
    end
   
end
