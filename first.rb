class User
    attr_reader :name

    def initialize (name, birth_year)
        @name = name
        @birth_year = birth_year
    end

    def age
        Time.now.year - @birth_year
    end
end

me = User.new("Nikita", 2004)
p me.name
puts me.age
