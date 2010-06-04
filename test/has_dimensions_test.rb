require File.join(File.dirname(__FILE__),'teststrap')

context "has_dimensions macro" do
  setup do
    Uploader.enable_processing = true
    @uploader = Uploader.new
    @uploader.store! File.open(fixture('fail.jpg'))
    @uploader
  end
    
  asserts "passes when the dimensions equal matches"  do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, :equal, 600,396).first
  end.equals :pass
  
  asserts "passes when the dimensions no larger than matches"  do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, :no_larger_than, 600,396).first
  end.equals :pass
  
  asserts "passes when the dimensions no lesser than matches"  do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, :no_smaller_than, 600,396).first
  end.equals :pass
  
  asserts "passes when the dimensions larger than matches"  do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, :larger_than, 500,296).first
  end.equals :pass
  
  asserts "passes when the dimensions lesser than matches"  do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, :no_smaller_than, 600,396).first
  end.equals :pass
  
  asserts "returns a helpful message" do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, :equal, 600,396).last
  end.matches %r{Uploader has dimensions equal width 600px and height 396px}
  
  asserts "fails when the dimensions do not match" do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, :equal, 12,13).first
  end.equals :fail
  
end