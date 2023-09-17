class Raspberry
    @@states = ["unripe", "half-ripe", "ripe"]

    def initialize(index)
        @index = index
        @state = @@states.first
    end
    
    def grow!
        if @state != @@states.last
            @state = @@states[@@states.index(@state)+1]
        end
    end
    def ripe?
        @state == @@states.last
    end
end

class RaspberryBush
    def initialize(count)
        @raspberries = []
        count.times {|i| @raspberries.append(Raspberry.new(i))}
    end

    def grow_all!
        @raspberries.each do |raspberry| 
            raspberry.grow!
        end
    end

    def ripe_all?
        @raspberries.each do |raspberry|
            if !(raspberry.ripe?)
                return false
            end
            return true
        end
    end

    def give_away_all!
        @raspberries.clear
    end
end


class Human
    attr_accessor :plant
    protected :plant
    def initialize(name, plant)
        @name = name
        @plant = plant
    end

    def work!
        @plant.grow_all!
    end

    def harvest
        if @plant.ripe_all?
            @plant.give_away_all!
            return
        end
        p "EARLY"
    end

    def self.knowledge_base
        puts "Самый лучший срок посадки осенью, перед заморозками, тогда весной, возможно,
уже можно будет попробовать первый урожай. Конечно, он не будет обильным, но все же. 
Высаживают малину на глубину около 35 сантиметров, на расстоянии друг от друга — 50 см."
    end
end
=begin
if __FILE__ == $PROGRAM_NAME
    

    Human.knowledge_base
    bush = RaspberryBush.new(5)
    human = Human.new("Nikita", bush)
    human.work!
    human.harvest
    human.work!
    human.harvest
end
=end

if __FILE__ == $PROGRAM_NAME
    p "What's your name?"
    name = gets.chop!
    bush = RaspberryBush.new(10)
    human = Human.new(name, bush)
    puts "Hi, #{@name}! Now you have 10 raspberry bushes. You can:\n1. Harvest raspberries\n2. Work to grow bushes\n3. Know your knowledge base\n4. Exit"

    while (n = gets.chop!.to_i) != 4
        case n
        when 1
            human.harvest
            p "You win"
        when 2
            human.work!
            p "Good job"
        when 3
            Human.knowledge_base
        else
            p "You entered an incorrect number"
        end
    end
end