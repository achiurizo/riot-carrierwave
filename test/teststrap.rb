require 'rubygems'
require 'riot'
require File.join(File.dirname(__FILE__),'..','lib','riot-carrierwave')


class Uploader < CarrierWave::Uploader::Base
  permissions 0777
end

class Riot::Situation

  def fixture(image)
    File.open File.join(File.dirname(__FILE__), 'fixtures', image)
  end
end
