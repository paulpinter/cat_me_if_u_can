note
    description: "This class represents the mice in the game."
    author:      "Johannes Zoettele"
    date:        "$Date$"
    revision:    "$Revision$"

class
    MICE

create
    make

feature {NONE} -- Initialization
    mice: ARRAY [MOUSE]
    random: RNG


feature -- Access
    make(rng: RNG)
        do
            random := rng
            mice := << default_mouse, default_mouse, default_mouse, default_mouse, default_mouse >>
        end
    default_mouse: MOUSE
        do
            create Result.make (random)
        end
    start_tunnels(network: NETWORK; field_size: INTEGER)
        local
            sub: SUBWAY
        do
            across mice as m loop
                sub := network.starting_point
                m.item.set_field_size(field_size)
                m.item.set_x(sub.get_x)
                m.item.set_y(sub.get_y)
            end
        end
    collission_check(player: PLAYER)
        do
            across mice as m loop
                if player.get_x = m.item.get_x and player.get_y = m.item.get_y and m.item.get_hide = 0 and  m.item.get_vanishing > 0 and not m.item.is_dead then
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
                if m.item.is_dead or m.item.get_vanishing = 0 then
                elseif m.item.get_hide > 0 then
                    m.item.decrease_hide
                else
                    m.item.move_randomly 
                end
            end
        end
    skull_check(x: INTEGER;y: INTEGER): BOOLEAN
        do
            across mice as m loop
                if x = m.item.get_x and y = m.item.get_y and m.item.is_dead and m.item.get_vanishing > 0 then
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
                if m.item.get_hide = 0 then
                    across network.network as s loop
                        if s.item.get_x = m.item.get_x and s.item.get_y = m.item.get_y then
                            r := 1 + random.get_random \\ s.item.get_exit.count
                            print("r: " + r.out + "%N")
                            m.item.set_x(s.item.get_exit[r].get_x)
                            m.item.set_y(s.item.get_exit[r].get_y)
                            if m.item.get_hide = 0 then
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
                if m.item.get_vanishing = 0 then
                    count := count + 1
                end
            end
            if count = mice.count then
                Result := True
            end
        end
    get_info
        do
            across mice as m loop
                m.item.get_info
            end
        end
end
