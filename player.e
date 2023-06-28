note
	description: "Player class for the game"
	author: "Johannes Zoettele"
	date: "$Date$"
	revision: "$Revision$"

class
    PLAYER

create
    make

feature{NONE} -- Initialization
    x: INTEGER
    y: INTEGER
    field_size: INTEGER

feature
    make
        do  
            x := 2
            y := 2
        end
    get_x: INTEGER
        do
            Result := x
        end
    get_y: INTEGER
        do
            Result := y
        end
    move_up
        do  
            if y > 2 then
                y := y - 1
            end
        end
    move_down
        do
            if y < field_size then
                y := y + 1
            end
        end
    move_right
        do
            if x < field_size then
                x := x + 1
            end
        end
    move_left
        do
            if x > 2 then
                x := x - 1
            end
        end
    set_field_size (f_size: INTEGER)
        do
            field_size := f_size
        end
end
