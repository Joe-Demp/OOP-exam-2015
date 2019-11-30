class Team
  def initialize(curler_a, curler_b)
    if curler_a.sex == :male
      @male = curler_a
      @female = curler_b
    else
      @male = curler_a
      @female = curler_b
    end
  end

  def satisfaction
    (@male.satisfaction(@female) + @female.satisfaction(@male)) / 2
  end

  def swap_males(other_team)
    @male, other_team.male = other_team.male, @male
  end

  def to_s
    "(#{@female.name}, #{@male.name}) Satisfaction: #{satisfaction}"
  end

  protected
  attr_accessor :male
end