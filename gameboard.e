class
    GAMEBOARD

create
    make

feature {NONE} -- Initialization
    mice: MICE
    network: NETWORK
    field: FIELD
    player: PLAYER
feature -- Access
    make(f: FIELD)
        do
            field := f
            create player.make(f)
            create mice.make(f)
            create network.make(f)
            mice.start_tunnels(network)
        end
    get_player: PLAYER
        do
            Result := player
        end
    get_mice: MICE
        do
            Result := mice
        end
    print_grid
        local
            i, j: INTEGER
        do  
            mice.goal_check(network)
            mice.collission_check(player)
            mice.move_mice
            mice.vanish_procedure
            mice.subway_check(network)
            from
                i := 1
            until
                i > field.get_size + 1
            loop
                from
                    j := 1
                until
                    j > field.get_size + 1
                loop

                    if i = 1 or i = field.get_size + 1 or j = 1 or j = field.get_size + 1 then
                        io.put_string ("🟪")
                    elseif i = player.get_y and j = player.get_x then
                        io.put_string ("🐱")
                    elseif network.position_check(j,i) then
                        io.put_string ("🚇")    
                    elseif mice.position_check(j,i) then
                        io.put_string ("🐭")
                    elseif mice.skull_check(j,i) then
                        io.put_string ("💀")
                    else
                        io.put_string ("🟩") 
                    end
                    j := j + 1
                end
                io.put_new_line
                i := i + 1
            end
        end
end
