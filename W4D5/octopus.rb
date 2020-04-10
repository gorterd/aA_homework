def sluggish_octopus(fishes)
    fishes.each do |fish|
        return fish if fishes.none? {|other_fish| other_fish.length > fish.length }
    end
end

def dominant_octopus(fishes)
    merge_sort(fishes) {|a,b| a.length <=> b.length}.last
end

def clever_octopus(fishies)
    fishies.inject {|biggest, fish| fish.length > biggest.length ? fish : biggest }
end


def merge_sort(array, &prc)
    return array if array.size < 2
    
    prc ||= Proc.new {|a,b| a <=> b }
    
    left = merge_sort(array[0...array.size/2], &prc)
    right = merge_sort(array[array.size/2..-1], &prc)
    
    merge(left, right, prc)
end

def merge(arr1, arr2, prc)
    merged = []
    
    until arr1.empty? || arr2.empty?
        prc.call(arr1.first, arr2.first) < 0 ? merged << arr1.shift : merged << arr2.shift 
    end
    
    merged + arr1 + arr2 
end


##################################

def slow_dance(dir, tiles)
    tiles.each_with_index { |tile, i| return i if tile == dir }
    nil
end

def fast_dance(dir, tiles)
    tiles[dir]
end

if __FILE__ == $PROGRAM_NAME
    fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    p sluggish_octopus(fishies)
    p dominant_octopus(fishies) 
    p clever_octopus(fishies)

    tiles_arr = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
    p slow_dance("right-down", tiles_arr)

    new_tiles = {
        "up"=>0, 
        "right-up"=>1, 
        "right"=>2, 
        "right-down"=>3, 
        "down"=>4, 
        "left-down"=>5, 
        "left"=>6,  
        "left-up"=>7 
    }
    p fast_dance("right-down", new_tiles)
end