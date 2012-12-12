require 'i18n'

module ColorNameI18n

  def self.keys
    I18n.translate('colors').keys.map{|k| k.to_s}
  end

end
