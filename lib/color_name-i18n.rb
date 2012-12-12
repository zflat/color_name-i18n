require 'i18n'
require_relative 'color_name-i18n/version'
require_relative 'color_name-i18n/list'

module ColorNameI18n

  def ColorNameI18n::init
    I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../locales'), '*.yml')]
    I18n.load_path.flatten!
  end

  if defined?(Rails) 
    require 'color_name-i18n/initializer.rb'
  else
    ColorNameI18n::init
  end

end
