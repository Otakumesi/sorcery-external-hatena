require 'thor'

class HatenaGenerator < Rails::Generators::Base
  def create_initializer_file
    include Thor::Actions::CreateFile
    create_file "config/initializers/extend_sorcery/external_add_hatena.rb", '../sorcery/external-add-hatena.rb'
    create_file "config/initializers/extend_sorcery/providers/hatena.rb", '../sorcery/providers/hatena.rb'
  end
end
