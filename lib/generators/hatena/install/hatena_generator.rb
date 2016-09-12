require 'rails'
require 'thor'

module Hatena
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        include Thor::Actions
        create_file "../../../config/initializers/expand_sorcery/external_add_hatena.rb", '../expand_sorcery/external-add-hatena.rb'
        create_file "../../../config/initializers/expand_sorcery/providers/hatena.rb", '../expand_sorcery/sorcery/providers/hatena.rb'
      end
    end
  end
end
