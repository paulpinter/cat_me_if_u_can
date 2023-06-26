class
    SUBWAY

create
    make

feature{NONE} -- Initialization
    x: INTEGER
    y: INTEGER
    exit: ARRAY[SUBWAY]
feature
    make
        do
            x := 0
            y := 0
            create exit.make_empty
        end
    set_x (new_x: INTEGER)
        do
            x := new_x
        end
    get_x: INTEGER
        do
            Result := x
        end
    get_y: INTEGER
        do
            Result := y
        end
    set_y (new_y: INTEGER)
        do
            y := new_y
        end
    set_exit (e: ARRAY[SUBWAY])
        do
            exit := e
        end
    get_exit: ARRAY[SUBWAY]
        do
            Result := exit
        end
end
