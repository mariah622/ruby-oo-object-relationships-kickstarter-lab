#rspec spec/kickstarter_spec.rb
class Project
    attr_reader :title

    @@all = []

    def initialize(title)
        @title = title
        save
    end 

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end 

    def backers
        backer = ProjectBacker.all.find_all do |x|
            x.project == self
        end 

        name = backer.collect do |x|
            x.backer
        end 
    end 

    def save
        self.class.all << self
    end 

    def self.all
        @@all
    end 
end 