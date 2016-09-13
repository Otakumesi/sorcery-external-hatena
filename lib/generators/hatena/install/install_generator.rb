require 'rails'

module Hatena
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../expand_sorcery")
      def create_initializer_file
        create_file "#{Rails.root}/config/initializers/expand_sorcery/external_add_hatena.rb", open('./external-add-hatena.rb')
        create_file "#{Rails.root}/config/initializers/expand_sorcery/providers/hatena.rb", open('./sorcery/providers/hatena.rb')
      end
    end
  end
end
