require_relative 'team.rb'

class Agency
  def initialize
    @males = []
    @females = []
  end

  def add_curler(curler)
    case curler.sex
    when :male then @males << curler
    when :female then @females << curler
    end
  end

  def create_teams
    @teams = []
    males_left = Array.new(@males)
    females_left = Array.new(@females)

    until males_left.empty? || females_left.empty?
      best_male = males_left.max
      best_female = females_left.max
      @teams << Team.new(best_male, best_female)

      males_left.delete_if { |man| man.equal?(best_male) }
      females_left.delete_if { |woman| woman.equal?(best_female) }
    end
  end

  def smart_create_teams
    create_teams
    max_fitness = teams_fitness

    i = 0
    while i < @teams.length
      j = i + 1
      while j < @teams.length
        # do a swap
        @teams[i].swap_males(@teams[j])

        # check new fitness
        new_fitness = teams_fitness

        # if better, leave it, change max_fitness, start again
        # else, swap back
        if new_fitness > max_fitness
          max_fitness = new_fitness
          i = 0
          break
        else
          @teams[i].swap_males(@teams[j])
        end
        j += 1
      end
      i += 1
    end
  end

  def teams_fitness
    @teams.reduce(0) { |sum,team| sum + team.satisfaction }
  end

  def each_curler
    @males.each do |man|
      yield man
    end
    @females.each do |woman|
      yield woman
    end
  end

  def to_s
    str = ''
    str += "MALE CURLERS:\n"
    @males.each { |man| str += man.to_s + "\n" }
    str += "FEMALE CURLERS:\n"
    @females.each { |woman| str += woman.to_s + "\n" }
    str
  end

  def teams_to_s
    str = ''
    @teams.each { |team| str += team.to_s + "\n" }
  end
end