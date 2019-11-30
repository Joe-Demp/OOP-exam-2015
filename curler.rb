class Curler
  attr_reader :name, :sex, :proficiency, :partner_proficiency

  def initialize(name, sex, proficiency, partner_prof)
    @name = name
    @sex = sex
    @proficiency = proficiency
    @partner_proficiency = partner_prof
  end

  def to_s
    "#{@name}'s proficiency is #{@proficiency}. " \
      "Seeks partner with proficiency >= #{@partner_proficiency}"
  end
end
