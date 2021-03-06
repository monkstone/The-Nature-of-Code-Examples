# NOC_3_02_forces_angular_motion
# The Nature of Code
# http://natureofcode.com
load_library :vecmath
require_relative 'attractor'
require_relative 'mover'

# NOC_3_02_forces_angular_motion
def setup
  size(640, 360)
  background(255)
  @movers = Array.new(20) { Mover.new(rand(0.1 .. 2), rand(width), rand(height)) }
  @a = Attractor.new(width, height)
end

def draw
  background(255)
  @a.display
  @movers.each do |m|
    force = @a.attract(m)
    m.apply_force(force)
    m.update
    m.display
  end
end
