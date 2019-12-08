class Player
  attr_reader :marker

  private
  def initialize(marker)
    @marker = marker
  end

  attr_writer :marker

  def to_s
    marker
  end
end