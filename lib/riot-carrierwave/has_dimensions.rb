module RiotCarrierwave
  class HasDimensionsAssertion < Riot::AssertionMacro
    register :has_dimensions

    def evaluate(model, type, width, height)
      image = RiotCarrierwave::ImageLoader.load_image(model.current_path)
      if image and compare(type, image, width, height)
        pass "#{model.class.name} has dimensions #{type} width #{width}px and height #{height}px"
      else
        fail "expected #{model.class.name} to have dimensions #{type} width #{width}px and height #{height}px"
      end
    end
    
    def compare(type, image, width,height)
      case type
      when :no_larger_than
        width >= image.width and height >= image.height
      when :no_smaller_than
        width <= image.width and height <= image.height
      when :larger_than
        width < image.width and height < image.height
      when :smaller_than
        width > image.width and height > image.height
      when :equal
        width == image.width and height == image.height
      else
        false
      end
    end
    
  end
end