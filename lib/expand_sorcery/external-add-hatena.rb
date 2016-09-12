require "sorcery"

module Sorcery
  module Controller
    module Submodules
      module ExternalAddHatena
        def self.prepended(base)
          require "sorcery/providers/hatena.rb"
          super(base)
        end
      end
    end
  end
end
