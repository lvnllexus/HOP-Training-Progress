require 'yaml'

module Serialization
  def self.save(game)
    Dir.mkdir('saves') unless Dir.exist?('saves')
    File.write('saves/saved_game.yml', YAML.dump(game))
    puts "Game saved!"
  end

  def self.load
    YAML.load(File.read('saves/saved_game.yml'))
  end
end
