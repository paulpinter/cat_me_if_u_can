note
	description: "This class represents a mouse in the game."
	author: "Paul Pinter"
	date: "$Date$"
	revision: "$Revision$"
class
    MOUSE

create
    make

feature{NONE} -- Initialization
    x: INTEGER
    y: INTEGER
    random: RNG
    dead: BOOLEAN
    vanishing: INTEGER
    field_size: INTEGER
    hide: INTEGER
feature
    make (rng: RNG)
        do
            x := 1
            y := 1
            vanishing := 5
            random := rng
            hide := random.get_random \\ 2
        end
    set_field_size(size: INTEGER)
        do
            field_size := size
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
    move_randomly
        local
            r: INTEGER
        do  
            r := random.get_random \\ 4
            if r = 0 then
                move_up
            elseif r = 1 then
                move_down
            elseif r = 2 then
                move_right
            elseif r = 3 then
                move_left
            end
        end
    kill
        do
            dead := True
        end
    vanish_procedure
        do
            if vanishing > 0 then
                vanishing := vanishing - 1
                end
        end
    set_vanishing(v: INTEGER)
        do
            vanishing := v
        end
    set_x (x_new: INTEGER)
        do
            x := x_new
        end
    set_y (y_new: INTEGER)
        do
            y := y_new
        end
    decrease_hide
        do
            hide := hide - 1
        end
    random_hide
        do
            hide := random.get_random \\ 2
        end
    is_dead: BOOLEAN
        do
            Result := dead
        end
    get_vanishing: INTEGER
        do
            Result := vanishing
        end
    get_hide: INTEGER
        do
            Result := hide
        end
    get_info
        do
             print("(x:" + x.out + ",y:" + y.out + ",van:" + vanishing.out + ",hide:" + hide.out + ",dead:" + dead.out + ")%N")
        end
end
