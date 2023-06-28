note
	description: "This class is the gameboard. It contains the field, the mice, the player and the network. It also contains the print_grid procedure which prints the grid."
	author: "Tim Dirr"
	date: "$Date$"
	revision: "$Revision$"

class
    GAMEBOARD

create
    make

feature {NONE} -- Initialization
    mice: MICE
    network: NETWORK
    player: PLAYER
    random: RNG
    field_size: INTEGER
feature -- Access
    make
        do  
            field_size := 10
            create random.make
            create player.construct
            create mice.make(random)
            create network.make(random)
            player.set_field_size(field_size)
            network.make_tunnel_connections(field_size)
            mice.start_tunnels(network, field_size)
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
            mice.subway_check(network)
            mice.move_mice
            mice.vanish_procedure
            mice.collission_check(player)
            from
                i := 1
            until
                i > field_size + 1
            loop
                from
                    j := 1
                until
                    j > field_size + 1
                loop
                    if i = 1 or i = field_size + 1 or j = 1 or j = field_size + 1 then
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
