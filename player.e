class
    PLAYER

create
    make

feature{NONE} -- Initialization
    x: INTEGER
    y: INTEGER
    field: FIELD
    

feature

    make (f: FIELD)
        do  
            field := f
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
end
