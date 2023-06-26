class
    RANDOM_NUMBER

create
    make

feature

    make
        do

        end
    random_number: INTEGER
        do
        create Result
            random_generator.forth
            Result := 1 + (random_generator.item \\ 10)
        end
feature {NONE} -- Implementation
    random_generator: RANDOM
        once 
            create Result.make
        end
end