# NOC_4_08_ParticleSystemSmoke_b
# The Nature of Code
# http://natureofcode.com
# Needs to run with jruby-complete (not system jruby)
load_library :vecmath
require_relative 'particle_system'

attr_reader :ps

def setup
  size(640, 360)
  img = load_image("#{Dir.pwd}/data/texture.png")
  @ps = ParticleSystem.new(0, Vec2D.new(width / 2, height - 75), img)
  smooth 4
end

def draw
  background(0)
  # Calculate a "wind" force based on mouse horizontal position
  dx = map1d(mouse_x, (0 .. width), (-0.2 .. 0.2))
  wind = Vec2D.new(dx, 0)
  ps.apply_force(wind)
  ps.run
  2.times { ps.add_particle }
  # Draw an arrow representing the wind force
  draw_vector(wind, Vec2D.new(width / 2, 50), 500)
end

# Renders a vector object 'v' as an arrow and a location 'loc'
def draw_vector(v, loc, scayl)
  push_matrix
  arrowsize = 4
  # Translate to location to render vector
  translate(loc.x, loc.y)
  stroke(255)
  # Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading)
  # Calculate length of vector & scale it to be bigger or smaller if necessary
  len = v.mag * scayl
  # Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0, 0, len, 0)
  line(len, 0, len - arrowsize, arrowsize / 2)
  line(len, 0, len - arrowsize, -arrowsize / 2)
  pop_matrix
end
