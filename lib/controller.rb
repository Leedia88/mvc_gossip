require 'csv'

class Controller 

attr_accessor :view

    def initialize
        @view = View.new
    end

    def create_gossip(csv_open)
        params = @view.create_gossip
        Gossip.new(params[:author], params[:content]).save
    end

    def index_gossips(gossips)
        # gossips = CSV.read("db/gossip.csv")
        gossips.map.with_index do |gossip, i|
            if i == 0
                print "| " + gossip[0].upcase.ljust(23) + "|"
                puts "| " + gossip[1].upcase.ljust(50) + "|"
            else
                print "| " + i.to_s + ". " + gossip[0].capitalize.ljust(20) + "|"
                puts "| " + gossip[1].ljust(50) + "|"
            end
        end
        puts
    end

    def delete_gossip(csv_file, i)
        gossips_array =[]
        CSV.foreach(csv_file) do |row|
            gossips_array << row
        end
        gossips_array.delete_at(i)
        CSV.open(csv_file, "w") do |csv|
            gossips_array.each do |gossip|
              csv << gossip
            end
        end
        puts "Gossip #{i} bien supprimé!! :)\n".green
    end

end
