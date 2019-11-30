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