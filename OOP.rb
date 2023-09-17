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


class Human < RaspberryBush
    def initialize(name)
        @name = name
        @plant = RaspberryBush.new(6)
    end

    def work!
        @plant.grow_all!
    end

    def harvest
        if @plant.ripe_all?
            @plant.give_away_all!
            p "урожай собран #{@name}"
            return
        end
        p "РАНО"
    end

    def self.knowledge_base
        puts "Самый лучший срок посадки осенью, перед заморозками, тогда весной, возможно,
         уже можно будет попробовать первый урожай. Конечно, он не будет обильным, но все же. 
         Высаживают малину на глубину около 35 сантиметров, на расстоянии друг от друга — 50 см."
    end
end

if __FILE__ == $PROGRAM_NAME
    Human.knowledge_base
    bush = RaspberryBush.new(5)
    human = Human.new("Nikita")
    human.work!
    human.harvest
    human.work!
    human.harvest
end