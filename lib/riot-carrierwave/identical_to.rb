module RiotCarrierwave
  class IdenticalToAssertion < Riot::AssertionMacro
    register :identical_to

    def evaluate(model, file)
      if model and FileUtils.identical?(model.path,file)
        pass("#{model.path} is identical to #{file}")
      else
        fail("expected #{model.path} to be identical to #{file}")
      end
    end
  end
end