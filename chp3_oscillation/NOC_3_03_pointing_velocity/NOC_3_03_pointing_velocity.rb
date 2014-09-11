# NOC_3_03_pointing_velocity
# http://natureofcode.com
load_library :vecmath
require_relative 'mover'

attr_reader :mover

def setup
  size(640, 360)
  @mover = Mover.new(width / 2, height / 2)
end

def draw
  background(255)
  mover.update
  mover.check_edges
  mover.display
end
