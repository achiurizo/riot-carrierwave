module RiotCarrierwave
  
  class ImageLoader # :nodoc:
    def self.load_image(filename)
      if defined? MiniMagick
        RiotCarrierwave::MiniMagickWrapper.new(filename)
      else
        unless defined? Magick
          begin
            require 'rmagick'
          rescue LoadError
            require 'RMagick'
          rescue LoadError
            puts "WARNING: Failed to require rmagick, image processing may fail!"
          end
        end
        RiotCarrierwave::MagickWrapper.new(filename)
      end
    end
  end

  class MagickWrapper # :nodoc:
    attr_reader :image
    
    def width; image.columns; end
    def height; image.rows; end

    def initialize(filename)
      @image = ::Magick::Image.read(filename).first
    end
  end

  class MiniMagickWrapper # :nodoc:
    attr_reader :image
    
    def width; image[:width]; end

    def height; image[:height]; end

    def initialize(filename)
      @image = ::MiniMagick::Image.from_file(filename)
    end
  end
end
