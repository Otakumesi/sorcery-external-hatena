require 'rails'
require 'thor'

module Hatena
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../expand_sorcery")
      def create_initializer_file
        include Thor::Actions
        create_file "../../../config/initializers/expand_sorcery/external_add_hatena.rb", './external-add-hatena.rb'
        create_file "../../../config/initializers/expand_sorcery/providers/hatena.rb", './sorcery/providers/hatena.rb'
      end
    end
  end
end
