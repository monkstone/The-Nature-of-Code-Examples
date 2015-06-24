# NOC_2_8_mutual_attraction
# http://natureofcode.com
load_library :vecmath
require_relative 'mover'

def setup
  size(800, 200)
  @movers = Array.new(20) { Mover.new(rand(width), rand(height), rand(0.1 .. 2)) }
end

def draw
  background(255)
  @movers.each do |m|
    @movers.each do |mm|
      next if m.equal? mm
      force = mm.attract(m)
      m.apply_force(force)
    end
    m.update
    m.display
  end
end
