# NOC_3_07_oscillating_objects
# The Nature of Code
# http://natureofcode.com

load_library :vecmath
require_relative 'oscillator'

attr_reader :oscillators

def setup
  size 800, 200
  smooth 4
  @oscillators = Array.new(10) { Oscillator.new(width, height) }
end

def draw
  background 255
  oscillators.each do |o|
    o.oscillate
    o.display
  end
end
