#rspec spec/kickstarter_spec.rb

class Backer 
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name 
        save
    end 

    def back_project(project)
        ProjectBacker.new(project, self)
    end 

    def backed_projects
        project = ProjectBacker.all.find_all do |x|
            x.backer == self
        end 

        name = project.collect do |x|
            x.project
        end 
    end 

    def save
        self.class.all << self
    end 

    def self.all 
        @@all
    end 
end
