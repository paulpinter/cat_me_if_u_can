class
    FIELD

create
    make

feature{NONE} -- Initialization
    size: INTEGER
    random_sequence: RANDOM

feature
    make (init_size: INTEGER)
        local
            l_time: TIME
            l_seed: INTEGER
        do
            size := init_size
            create l_time.make_now
            l_seed := l_time.hour
            l_seed := l_seed * 60 + l_time.minute
            l_seed := l_seed * 60 + l_time.second
            l_seed := l_seed * 1000 + l_time.milli_second
            create random_sequence.set_seed (l_seed)
        end
    get_size: INTEGER
        do
            Result := size
        end
    get_random: INTEGER
        do
            random_sequence.forth
            Result := random_sequence.item
        end
    get_random_field_pos: INTEGER
        do
            random_sequence.forth
            Result := 2 + (random_sequence.item \\ (size - 1))
        end
end
