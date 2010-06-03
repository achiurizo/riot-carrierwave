module RiotCarrierwave
  class HasDimensionsAssertion < Riot::AssertionMacro
    register :has_dimensions

    def evaluate(model, width, height)
      image = RiotCarrierwave::ImageLoader.load_image(model.current_path)
      if image and (width == image.width and height == image.height)
        pass "#{model.class.name} has dimensions width #{width}px and height #{height}px"
      else
        fail "expected #{model.class.name} to have dimensions width #{width}px and height #{height}px"
      end
    end
  end
end