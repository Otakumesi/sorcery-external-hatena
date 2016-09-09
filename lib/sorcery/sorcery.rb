module Sorcery
  module Controller
    module Submodules
      module ExternalAddHatena
        def self.included(base)
          require "sorcery/providers/hatena"
          super(base)
        end
      end
    end
  end
end

ActionController::Base.send(:prepend, Sorcery::Controller::Submodules::ExternalAddHatena)
