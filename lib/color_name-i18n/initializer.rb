module ColorNameI18n

  TPREFIX = 'color_keys' unless defined?(TPREFIX)

  def ColorNameI18n::init
    I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../../locales'), '*.yml')]
    I18n.load_path.flatten!
  end

  if defined?(Rails) 
    class Railtie < ::Rails::Railtie #:nodoc:
      initializer 'rails-i18n' do |app|
        ColorNameI18n::init
      end
    end
  else
    ColorNameI18n::init
  end
end
