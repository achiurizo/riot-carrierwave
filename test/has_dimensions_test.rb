require File.join(File.dirname(__FILE__),'teststrap')

context "has_dimensions macro" do
  setup do
    Uploader.enable_processing = true
    @uploader = Uploader.new
    @uploader.store! File.open(fixture('fail.jpg'))
    @uploader
  end
    
  asserts "passes when the dimensionss matches"  do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, 600,396).first
  end.equals :pass
  
  asserts "returns a helpful message" do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, 600,396).last
  end.matches %r{Uploader has dimensions width 600px and height 396px}
  
  asserts "fails when the dimensionss do not match" do 
    RiotCarrierwave::HasDimensionsAssertion.new.evaluate(topic, 12,13).first
  end.equals :fail
  
end