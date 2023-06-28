note
	description: "This class is used to generate random numbers between 1 and 10."
	author: "Tim Dirr"
	date: "$Date$"
	revision: "$Revision$"

class
    RNG

create
    make

feature {NONE} -- Implementation
    random_number_generator: RANDOM

feature
    make        
        local
            l_time: TIME
            l_seed: INTEGER
        do
            create l_time.make_now
            l_seed := l_time.hour
            l_seed := l_seed * 60 + l_time.minute
            l_seed := l_seed * 60 + l_time.second
            l_seed := l_seed * 1000 + l_time.milli_second 
            create random_number_generator.set_seed (l_seed)
        end
    random_number: INTEGER
        do
        create Result
            random_number_generator.forth
            Result := 1 + (random_number_generator.item \\ 10)
        end
    get_random: INTEGER
        do
            random_number_generator.forth
            Result := random_number_generator.item
        end

end