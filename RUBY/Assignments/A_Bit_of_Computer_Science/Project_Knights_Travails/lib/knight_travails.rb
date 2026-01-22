# lib/knight_travails.rb

def valid_moves(pos)
  x, y = pos
  moves = [
    [x + 2, y + 1],
    [x + 2, y - 1],
    [x - 2, y + 1],
    [x - 2, y - 1],
    [x + 1, y + 2],
    [x + 1, y - 2],
    [x - 1, y + 2],
    [x - 1, y - 2]
  ]

  # Only keep moves within an 8x8 board 
  moves.select { |nx, ny| nx.between?(0, 7) && ny.between?(0, 7) }
end

def knight_moves(start_pos, end_pos)
  return [start_pos] if start_pos == end_pos

  queue = [[start_pos, [start_pos]]]  # queue elements: [position, path_array]
  visited = { start_pos => true }

  until queue.empty?
    current, path = queue.shift

    valid_moves(current).each do |next_pos|
      next if visited[next_pos]

      new_path = path + [next_pos]  # extend path

      return new_path if next_pos == end_pos

      visited[next_pos] = true
      queue << [next_pos, new_path]
    end
  end

  nil  # no path found
end
