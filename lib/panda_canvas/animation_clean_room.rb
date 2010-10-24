module PandaCanvas

  # AnimationCleanRoom is used to capture and store method calls for delayed execution.
  class AnimationCleanRoom

    # Array of methods that need to be passed to canvas.
    attr_accessor :canvas_calls

    # Current frame number.
    attr_accessor :frame

    # Initializes the clean object for method call capturing.
    # TexPlay +image+ is used for TexPlay drawing methods.
    def initialize(image)
      @image = image
    end

    # Capures and stores all missing method calls in the instance.
    def method_missing(sym, *args)
      if DrawingMethods::CANVAS_CALLS.include? sym
        @canvas_calls << [sym, *args]
      elsif Gosu::Image.public_instance_methods.include? sym
        @image.send sym, *args
      else
        super
      end
    end

  end # CleanRoom

end # PandaCanvas