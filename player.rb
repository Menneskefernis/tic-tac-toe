class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  private
  attr_writer :marker

  def to_s
    marker
  end
end