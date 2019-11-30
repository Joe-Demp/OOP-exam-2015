require_relative 'agency.rb'
require_relative 'curler.rb'

agency = Agency.new

IO.foreach('male_curlers.txt') do |line|
  parts = line.split
  man = Curler.new(parts[0], :male, parts[1].to_i, parts[2].to_i)
  agency.add_curler(man)
end

IO.foreach('women_curlers.txt') do |line|
  parts = line.split
  woman = Curler.new(parts[0], :female, parts[1].to_i, parts[2].to_i)
  agency.add_curler(woman)
end

# Part 1
puts agency.to_s
puts

# Part 2
agency.create_teams
puts agency.teams_to_s
puts "Fitness: #{agency.teams_fitness}"
puts

# Part 3
puts 'Elite Curlers:'
agency.each_curler do |curler|
  puts curler.name + "\n" if curler.proficiency == 10
end
puts

# Part 4
agency.smart_create_teams
puts agency.teams_to_s
puts "Fitness: #{agency.teams_fitness}"
puts

