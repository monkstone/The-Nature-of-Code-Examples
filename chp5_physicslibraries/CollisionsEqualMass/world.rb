# Class provides an OO way constraining a Mover in a 2D space
# use
# world = World.new((0..width), (0..height))
# world.constrain_mover(mover)
class World
  attr_reader :xrange, :yrange, :boundary_x, :boundary_y

  def initialize(xrange, yrange)
    @xrange, @yrange = xrange, yrange
  end

  # @param mover is expected respond loc, vel
  # that in turn respond to x and y getter/setters (Vec2D does this)

  def constrain_mover(mover)
    # Note clip functionality, extends Range in ruby-processing
    unless xrange.cover? mover.loc.x
      mover.vel.x *= -1
      mover.loc.x = xrange.clip mover.loc.x
    end
    return if yrange.cover? mover.loc.y
    mover.vel.y *= -1
    mover.loc.y = yrange.clip mover.loc.y
  end
end
