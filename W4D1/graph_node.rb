require "set"

class GraphNode
    attr_reader :val, :neighbors
    attr_writer :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def inspect
        {"value" => val, "neighbors" => neighbors.map(&:val)}.inspect
    end
end

def bfs(start_node, target_val)
    visited = Set.new
    queue = [start_node]

    until queue.empty?
        cur_node = queue.shift
        return cur_node if cur_node.val == target_val
        visited.add(cur_node)

        cur_node.neighbors.each do |neighbor_node|
            queue << neighbor_node unless visited.include?(neighbor_node)
        end
    end

    nil
end
