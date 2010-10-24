libdir = File.dirname(__FILE__)
$:.unshift(libdir) unless $:.include?(libdir)

require 'texplay'
require 'panda_canvas/drawing_methods'
require 'panda_canvas/animation_canvas'
require 'panda_canvas/animation_clean_room'
require 'panda_canvas/canvas'
require 'panda_canvas/clean_room'

# Panda Canvas is an educational 2D drawing canvas.
module PandaCanvas

  class << self

    # Reader for the Canvas instance.
    # Used to access the underlying TexPlay image.
    attr_reader :canvas

    # Takes a +block+ with drawing code.
    # The code is then drawn in a window with dimensions +width+ and +height+.
    def draw(width=640, height=480, &block)
      clean_room = CleanRoom.new
      clean_room.instance_eval(&block)
      @canvas = Canvas.new(width, height, clean_room.calls)
      @canvas.show
    end

    # Takes a +block+ with animation code.
    # The code is then drawn in a window with dimensions +width+ and +height+.
    def animate(width=640, height=480, &block)
      @canvas = AnimationCanvas.new(width, height, &block)
      @canvas.show
    end

  end # class << self

end # PandaCanvas