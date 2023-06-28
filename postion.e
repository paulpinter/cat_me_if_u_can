note
	description: "Player class for the game"
	author: "Johannes Zoettele"
	date: "$Date$"
	revision: "$Revision$"

class
    POSITION

create
    init


feature{PLAYER,GAMEBOARD,MICE}
    x: INTEGER
    y: INTEGER

    init
        do  
            x := 1
            y := 1
        end
    get_x: INTEGER
        do
            Result := x
        end
    get_y: INTEGER
        do
            Result := y
        end
    set_x (x_new: INTEGER)
        do
            x := x_new
        end
    set_y (y_new: INTEGER)
        do
            y := y_new
        end
    end