require 'thor'

module Hatena
  class InstallGenerator < Rails::Generators::Base
    def create_initializer_file
      include Thor::Actions::CreateFile
      create_file "config/initializers/expand_sorcery/external_add_hatena.rb", '../expand_sorcery/external-add-hatena.rb'
      create_file "config/initializers/expand_sorcery/providers/hatena.rb", '../expand_sorcery/sorcery/providers/hatena.rb'
    end
  end
end
