require File.join(File.dirname(__FILE__),'teststrap')

context "has_permission macro" do
  setup do
    Uploader.enable_processing = true
    @uploader = Uploader.new
    @uploader.store! File.open(fixture('test.jpg'))
    @uploader
  end
    
  asserts "passes when the permissions matches"  do 
    RiotCarrierwave::HasPermissionAssertion.new.evaluate(topic, 0777).first
  end.equals :pass
  
  asserts "returns a helpful message" do 
    RiotCarrierwave::HasPermissionAssertion.new.evaluate(topic, 0777).last
  end.matches %r{Uploader has permission of 777}
  
  asserts "fails when the permissions do not match" do 
    RiotCarrierwave::HasPermissionAssertion.new.evaluate(topic, 0600).first
  end.equals :fail
  
end