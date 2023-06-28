note
	description: "This class is responsible for creating the subway network and the tunnels between the stations."
	author: "Florian Freitag"
	date: "$Date$"
	revision: "$Revision$"

class
    NETWORK

create
    make

feature{NONE}
    random: RNG

feature
    goal: INTEGER
    network: ARRAY [SUBWAY]
    field_size: INTEGER

    make(rng: RNG)
        do
            create network.make_empty
            random:= rng
        end
    
    make_tunnel_connections(size: INTEGER)
        local
            temp_x, temp_y: INTEGER
            far: BOOLEAN
            r: INTEGER
            i: INTEGER
        do
            field_size := size
            network := << default_subway, default_subway, default_subway, default_subway, default_subway >>
            goal:= 1
            across network as n loop
                temp_x := get_random_field_pos
                temp_y := get_random_field_pos
                far := false
                from until far loop
                    if nearby_check(temp_x, temp_y) then
                        temp_x := get_random_field_pos
                        temp_y := get_random_field_pos
                    else
                        far := True
                    end
                end
                n.item.set_x (temp_x)
                n.item.set_y (temp_y)
            end

            -- make tunnel connections
            i := 1
            from
              
            until 
				i > network.count
            loop
                r := random.get_random \\ 2
                if i = goal then
                    network[i].set_exit(<< network[i]>>)
                    i := i + 1
                elseif r = 1 then
                    if i + 2 <= network.count then
                        network[i].set_exit(<< network[i], network[i+1], network[i+2]>>)
                        network[i+1].set_exit(<< network[i], network[i+1], network[i+2]>>)
                        network[i+2].set_exit(<< network[i], network[i+1], network[i+2]>>)
                        i := i + 3
                    elseif i + 1 < network.count then
                        network[i].set_exit(<< network[i], network[i+1]>>)
                        network[i+1].set_exit(<< network[i], network[i+1]>>)
                        i := i + 2
                    else
                        network[i].set_exit(<< network[i]>>)
                        i := i + 1
                    end
                elseif r = 0 then
                    if i + 1 <= network.count then
                        network[i].set_exit(<< network[i], network[i+1]>>)
                        network[i+1].set_exit(<< network[i], network[i+1]>>)
                        i := i + 2
                    else
                        network[i].set_exit(<< network[i]>>)
                        i := i + 1
                    end
                end                
            end
            
        end
    default_subway: SUBWAY
        do
            create Result.make
        end
    position_check(x: INTEGER;y: INTEGER): BOOLEAN
        do
            across network as n loop
                if x = n.item.get_x and y = n.item.get_y then
                    Result := True
                end
            end
        end
    nearby_check(x: INTEGER;y: INTEGER): BOOLEAN
        do
            across network as n loop
               if x = n.item.get_x or y = n.item.get_y then
                    Result := True
                end
            end
        end
    black_hole_check
        do
            across network as n loop
                across n.item.get_exit as e loop
                        print("(" + e.item.get_x.out + " " + e.item.get_y.out + ")") 
                end
            end
        end
    count_exit: INTEGER
        local
            count: INTEGER
        do
            across network as n loop
                across n.item.get_exit as e loop
                    count := count + 1
                end
            end
            Result := count
        end
    starting_point: SUBWAY
        local
            r: INTEGER
        do  
            r := 2 + (random.get_random \\ network.count - 1)
            Result := network[r]
        end
    get_random_field_pos: INTEGER
        local
            rand: INTEGER
        do
            rand := random.get_random
            Result := 2 + (rand \\ (field_size - 1))
        end
end
