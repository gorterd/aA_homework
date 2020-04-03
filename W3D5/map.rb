class Map

    def initialize
        @map = []
    end

    def set(key, value)
        i = pair_index_of_key(key)
    
        if i
            map[i][1] = value
        else
            map << [key, value]
        end

        true
    end

    def get(key)
        map.each { |k,v| return v if k == key }
    end

    def delete(key)
        i = pair_index_of_key(key)
        map.delete_at(i)
        i ? true : false
    end

    def show
        map.each { |k,v| puts "#{k} => #{v}"}
        true
    end

    private

    attr_reader :map

    def pair_index_of_key(key)
        map.each_with_index { |(k,v), i| return i if k == key }
        nil
    end
end