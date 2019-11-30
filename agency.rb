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

  def to_s
    str = ''
    str += "MALE CURLERS:\n"
    @males.each { |man| str += man.to_s + "\n" }
    str += "FEMALE CURLERS:\n"
    @females.each { |woman| str += woman.to_s + "\n" }
    str
  end
end