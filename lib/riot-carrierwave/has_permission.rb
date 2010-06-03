module RiotCarrierwave
  class HasPermissionAssertion < Riot::AssertionMacro
    register :has_permission

    def evaluate(model, permission)
      if model and ((File.stat(model.path).mode & 0777) == permission)
        pass("#{model.class.name} has permission of #{permission.to_s(8)}")
      else
        fail("expected #{model.class.name} to have permission of #{permission.to_s(8)}")
      end
    end
  end
end