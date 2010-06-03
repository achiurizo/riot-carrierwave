require 'rubygems'
require 'riot'
require File.join(File.dirname(__FILE__),'..','lib','riot-carrierwave')


class Uploader < CarrierWave::Uploader::Base
  permissions 0777
end

def fixture(image)
  File.join(File.dirname(__FILE__), 'fixtures', image)
end