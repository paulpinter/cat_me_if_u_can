note
	description: "Player class for the game"
	author: "Johannes Zoettele"
	date: "$Date$"
	revision: "$Revision$"

class
    PLAYER

inherit
    POSITION

create
    construct

feature{NONE} -- Initialization
    field_size: INTEGER

feature
    construct
        do  
            set_x(2)
            set_y(2)
        end
    move_up
        do  
            if get_y > 2 then
                y := y - 1
            end
        end
    move_down
        do
            if get_y < field_size then
                y := y + 1
            end
        end
    move_right
        do
            if get_x < field_size then
                x := x + 1
            end
        end
    move_left
        do
            if get_x > 2 then
                x := x - 1
            end
        end
    set_field_size (f_size: INTEGER)
        do
            field_size := f_size
        end
    get_field_size: INTEGER
        do
            Result := field_size
        end
end
