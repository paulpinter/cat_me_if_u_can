class
    MICE

create
    make

feature {NONE} -- Initialization
    mice: ARRAY [MOUSE]
    field: FIELD


feature -- Access
    make(f: FIELD)
        do
            field := f
            mice := << default_mouse, default_mouse, default_mouse, default_mouse, default_mouse >>
        end
    default_mouse: MOUSE
        do
            create Result.make (field)
        end
    start_tunnels(network: NETWORK)
        local
            sub: SUBWAY
        do
            across mice as m loop
                sub := network.starting_point
                m.item.set_x(sub.get_x)
                m.item.set_y(sub.get_y)
            end
        end
    collission_check(player: PLAYER)
        do
            across mice as m loop
                if m.item.is_dead or m.item.vanishing = 0 and m.item.hide = 0 then
                elseif player.get_x = m.item.get_x and player.get_y = m.item.get_y then
                    m.item.kill 
                end
            end
        end
    vanish_procedure
        do
            across mice as m loop
                if m.item.is_dead then
                    m.item.vanish_procedure
                end
            end
        end
    move_mice
        do
            across mice as m loop
                if m.item.is_dead or m.item.vanishing = 0 then
                elseif m.item.hide > 0 then
                    m.item.decrease_hide
                else
                    m.item.move_randomly 
                end
            end
        end
    skull_check(x: INTEGER;y: INTEGER): BOOLEAN
        do
            across mice as m loop
                if x = m.item.get_x and y = m.item.get_y and m.item.is_dead and m.item.vanishing > 0 then
                    Result := True
                end
            end
        end
    position_check(x: INTEGER;y: INTEGER): BOOLEAN
        do
            across mice as m loop
                if x = m.item.get_x and y = m.item.get_y and not m.item.is_dead then
                    Result := True
                end
            end
        end
    count_dead: INTEGER
        local
            count: INTEGER
        do
            across mice as m loop
                if m.item.is_dead then
                    count := count + 1
                end
            end
            Result := count
        end
    goal_check(network: NETWORK)
        local
            goal: SUBWAY
        do
            goal := network.network[network.goal]
            across mice as m loop
                if goal.get_x = m.item.get_x and goal.get_y = m.item.get_y then
                    m.item.set_vanishing(0)
                end
            end
        end
    subway_check(network: NETWORK)
        local
            r: INTEGER
        do
            across mice as m loop
                if m.item.hide = 0 then
                    across network.network as s loop
                        if s.item.get_x = m.item.get_x and s.item.get_y = m.item.get_y then
                            r := 1 + field.get_random \\ s.item.get_exit.count
                            m.item.set_x(s.item.get_exit[r].get_x)
                            m.item.set_y(s.item.get_exit[r].get_y)
                            if m.item.hide = 0 then
                                m.item.random_hide
                            end
                        end
                    end
                end
            end
        end
    all_vanished: BOOLEAN
        local
            count: INTEGER
        do
            across mice as m loop
                if m.item.vanishing = 0 then
                    count := count + 1
                end
            end
            if count = mice.count then
                Result := True
            end
        end
end
