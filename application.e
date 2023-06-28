note
	description: "This is a simple game where you have to kill mice."
	author: "Paul Pinter"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization
	make
			-- Launch `Current'.
		local
			read_char: CHARACTER
			board: GAMEBOARD
			term: TERMINAL
			field: FIELD
			player: PLAYER
			exit: BOOLEAN
			score: INTEGER
		do
			create field.make (10)
			create term.make
			term.set_non_blocking
			term.make_term_raw
			create board.make(field)
			player := board.get_player
			print ("%/27/[25l") -- make cursor invisible
			from until exit loop
				print ("%/27/[1J")  -- erase screen
				print ("%/27/[H")   -- move cursor to top left
				read_char := term.get_char
				inspect read_char
					when 'a' then
						player.move_left
					when 'd' then
						player.move_right
					when 'w' then
						player.move_up
					when 's' then
						player.move_down
					when 'q' then
						exit := True
					else
				end
				board.print_grid
			if(board.get_mice.all_vanished) then
				exit := True
			end
				sleep (1000 * 1000 * 500)
			end

			score := board.get_mice.count_dead
			io.put_string("You killed " + score.out + " mice!")
		end
end
