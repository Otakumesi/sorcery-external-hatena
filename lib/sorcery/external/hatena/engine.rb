require '../../sorcery'

module Sorcery
  module External
    module Hatena
      class Engine < ::Rails::Engine
        initializers 'sorcery.action_controller_extensions' do
          include Sorcery::Providers::Hatena
          include Sorcery::Controller::Submodules::ExternalAddHatena
        end
      end
    end
  end
end
