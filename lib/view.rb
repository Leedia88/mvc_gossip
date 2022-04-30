class View 

    def initialize
    end

    def create_gossip
        puts "Quel.le est l'auteur.e ?"
        print " > "
        author = gets.chomp
        puts "quel est le potin?"
        gossip = gets.chomp
        return params = {content: gossip, author: author}
    end

end