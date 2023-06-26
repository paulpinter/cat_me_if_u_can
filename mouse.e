class
    MOUSE

create
    make

feature{NONE} -- Initialization
    x: INTEGER
    y: INTEGER
    field: FIELD

feature
    is_dead: BOOLEAN
    vanishing: INTEGER
    hide: INTEGER
    make (f: FIELD)
        do
            field := f
            x := 1
            y := 1
            vanishing := 5
            hide := field.get_random \\ 2
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
            if y < field.get_size then
                y := y + 1
            end
        end
    move_right
        do
            if x < field.get_size then
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
            r := field.get_random \\ 4
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
            is_dead := True
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
            hide := field.get_random \\ 5
        end
end
