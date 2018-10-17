class Board
	attr_accessor :cases
	def initialize
		@cases = [[" ", " " ," "],[ " "," "," "],[" "," "," "]]
	end

	def show_board
		for i in 0...@cases.length
			for y in 0... @cases.length
				print @cases[i][y]+"|"
			end
			puts
			puts "------"
		end
	end
end



class Boardcase
	
	def initialize
		@board = Board.new
	end

	def tableau(params = nil,sigle = nil,tour = nil)
		
		case params
			when 1
			@board.cases[0][0] = sigle
			when 2
			@board.cases[0][1] = sigle
			when 3
			@board.cases[0][2] = sigle
			when 4
			@board.cases[1][0] = sigle
			when 5
			@board.cases[1][1] = sigle
			when 6
			@board.cases[1][2] = sigle
			when 7
			@board.cases[2][0] = sigle
			when 8
			@board.cases[2][1] = sigle
			when 9 
			@board.cases[2][2] = sigle
		end
			@board.show_board
		if @board.cases[0][0] == "o" && @board.cases[0][1] == "o" && @board.cases[0][2] == "o" || @board.cases[0][0] == "x" && @board.cases[0][1] == "x" && @board.cases[0][2] == "x"then
			puts "#{tour} à gagner!!!"
			exit
		elsif @board.cases[1][0] == "o" && @board.cases[1][1] == "o" && @board.cases[1][2] == "o" || @board.cases[1][0] == "x" && @board.cases[1][1] == "x" && @board.cases[1][2] == "x" then
			puts "#{tour} à gagner!!!"
			exit
		elsif @board.cases[2][0] == "o" && @board.cases[2][1] == "o" && @board.cases[2][2] == "o" || @board.cases[2][0] == "x" && @board.cases[2][1] == "x" && @board.cases[2][2] == "x" then
			puts "#{tour} à gagner!!!"
			exit
		elsif @board.cases[0][0] == "o" && @board.cases[1][0] == "o" && @board.cases[2][0] == "o" || @board.cases[0][0] == "x" && @board.cases[1][0] == "x" && @board.cases[2][0] == "x" then
			puts "#{tour} à gagner!!!"
			exit
		elsif @board.cases[0][1] == "o" && @board.cases[1][1] == "o" && @board.cases[2][1] == "o" || @board.cases[0][1] == "x" && @board.cases[1][1] == "x" && @board.cases[2][1] == "x" then
			puts "#{tour} à gagner!!!"
			exit
		elsif @board.cases[0][2] == "o" && @board.cases[1][2] == "o" && @board.cases[2][2] == "o" || @board.cases[0][2] == "x" && @board.cases[1][2] == "x" && @board.cases[2][2] == "x" then
			puts "#{tour} à gagner!!!"
			exit
		elsif @board.cases[0][0] == "o" && @board.cases[1][1] == "o" && @board.cases[2][2] == "o" || @board.cases[0][0] == "x" && @board.cases[1][1] == "x" && @board.cases[2][2] == "x" then
			puts "#{tour} à gagner!!!"
			exit
		elsif @board.cases[0][2] == "o" && @board.cases[1][1] == "o" && @board.cases[2][0] == "o" || @board.cases[0][2] == "x" && @board.cases[1][1] == "x" && @board.cases[2][0] == "x" then
			puts "#{tour} à gagner!!!"
			exit
		end
	end
end


class Player
	attr_accessor :joueur_1, :joueur_2 
	def initialize(joueur_1 = nil, joueur_2 = nil)
		@joueur_1 = joueur_1
		@joueur_2 = joueur_2
	end
end




class Game
	
	def initialize
		@boardcase = Boardcase.new
	end

	def go
		count = 0
		sigle = "x"
		puts "Entrer le nom du premier joueur"
		joueur_1 = gets.chomp
		puts "Entrer le nom du deuxième joueur"
		joueur_2 = gets.chomp
		joueur = Player.new(joueur_1,joueur_2)
		j1 =  joueur.joueur_1
		j2 =  joueur.joueur_2
		@tour = j1
		while count < 9 
			puts "C'est à votre tour #{@tour} d'entrer une valeur entre 1 à 9"
			print ">"
			x = Integer(gets.chomp)
			if x == 1 ||  x == 2 ||  x == 3 ||  x == 4 ||  x == 5||  x == 6||  x == 7||  x == 8 ||  x == 9 then
				if sigle == "x" then
					sigle = "o"
					@boardcase.tableau(x,sigle,@tour)
				elsif sigle == "o" then
					sigle = "x"
					@boardcase.tableau(x,sigle,@tour)
				end
				count += 1 
				if @tour == j1 then
					@tour = j2
				elsif @tour == j2 then
					@tour = j1
				end
			else
				message('inatendu')
				@tour == @tour
			end
		end
		message('nulls')
	end

	def message(msg)
		if msg == 'inatendu' then
			puts "#{@tour}: la valeur doit être compris entre 1 à 9"
		elsif msg == 'nulls' then
			puts "C'est un match null"
		end
	end
end

Game.new.go




