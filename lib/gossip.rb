class Gossip

    attr_reader :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        headers = ["author", "content"]
        
        # CSV.foreach("db/gossip.csv") do |row|
        #     films_info << row
        #   end
        CSV.open("db/gossip.csv", "a+") do |csv|
            csv << headers if csv.count.eql? 0
            csv << [@author, @content]
        end
        puts " >> C'est dans la boite, merci!\n\n".magenta
    end

end
