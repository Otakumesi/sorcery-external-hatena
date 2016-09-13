require 'rails'
require 'fileutils'

module Hatena
  module Generators
    class InstallGenerator < Rails::Generators::Base
      #source_root File.expand_path(File.expand('../../../expand_sorcery', __FILE__))
      def create_initializer_file
        source_path = File.expand_path(File.expand('../../../expand_sorcery', __FILE__))
        FileUtils.cp_r "#{Rails.root}/config/initializers/expand_sorcery/external_add_hatena.rb", "#{source_path}/expand_sorcery/external_add_hatena.rb"
        FileUtils.cp_r "#{Rails.root}/config/initializers/expand_sorcery/sorcery/providers/hatena.rb", "#{source_root}/expand_sorcery/sorcery/providers/hatena.rb"
      end
    end
  end
end
