class Router

    def initialize
        @controller = Controller.new
    end

    def perform
        while true
            case menu
            when 1
                puts "Tu as choisi de créer un gossip\n\n".blue
                @controller.create_gossip(CSV.open("db/gossip.csv", "a+"))
            when 2
                puts "Tu as choisis d'afficher tous les potins\n\n".blue
                @controller.index_gossips(CSV.read("db/gossip.csv"))
            when 3
                puts "Tu as choisi de supprimer un potin!\n\n".blue
                @controller.index_gossips(CSV.read("db/gossip.csv"))
                puts "Lequel veux tu supprimer?"
                print ">"
                index = gets.chomp.to_i
                @controller.delete_gossip("db/gossip.csv",index)
                
            when 4
                puts "À bientôt !".magenta
                break
            else
                puts "Ce choix n'existe pas, merci de ressayer".red
            end
        end
    end

    def menu
        puts "_"*50
        puts "*"*50
        puts "Tu veux faire quoi jeune mouss' ?"
        puts "1. Je veux créer un gossip"
        puts "2. Je veux lister tous les potins"
        puts "3. Je veux supprimer un potin"
        puts "4. Je veux quitter l'app"
        return gets.chomp.to_i
    end

end