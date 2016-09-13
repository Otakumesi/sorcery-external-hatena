require 'rails'
require 'fileutils'

module Hatena
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        source_path = File.expand_path(File.expand_path('../../../../expand_sorcery', __FILE__))
        FileUtils.mkdir_p "#{Rails.root}/config/initializers/expand_sorcery/sorcery/providers"
        FileUtils.cp_r "#{source_path}/external-add-hatena.rb", "#{Rails.root}/config/initializers/expand_sorcery/external-add-hatena.rb"
        FileUtils.cp_r "#{source_path}/sorcery/providers/hatena.rb", "#{Rails.root}/config/initializers/expand_sorcery/sorcery/providers/hatena.rb"
      end
    end
  end
end
