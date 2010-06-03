require File.join(File.dirname(__FILE__),'teststrap')

context "identical_to macro" do
  setup do
    Uploader.enable_processing = true
    @uploader = Uploader.new
    @uploader.store! File.open(fixture('test.jpg'))
    @uploader
  end
    
  asserts "passes when the files are identical matches"  do 
    RiotCarrierwave::IdenticalToAssertion.new.evaluate(topic, fixture('test.jpg')).first
  end.equals :pass
  
  asserts "returns a helpful message" do 
    RiotCarrierwave::IdenticalToAssertion.new.evaluate(topic, fixture('test.jpg')).last
  end.matches %r{is identical to #{fixture('test.jpg')}}
  
  asserts "fails when the permissions do not match" do 
    RiotCarrierwave::IdenticalToAssertion.new.evaluate(topic, fixture('fail.jpg')).first
  end.equals :fail
  
end