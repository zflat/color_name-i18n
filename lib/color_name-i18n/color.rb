require 'active_model'

module ColorNameI18n

  class Color
    include ActiveModel::Validations

    class KeyFormatValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        if value.length != 6
          record.errors.add(attribute, 
                            (options[:message] || I18n.translate(TPREFIX+"_messages.invalid_key")))
        end
      end
    end
    
    class KeyLookupValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        unless ColorNameI18n::keys.include?(value)
          record.errors.add(attribute, 
                            (options[:message] || I18n.translate(TPREFIX+"_messages.invalid_key")))
        end
      end
    end
    
    attr_reader :key

    # @param [String, .has_key?, to_s] arg The key used to 
    # look up the color data or a hash containing data of form
    # {:key => String, :name => String, :alt => String}
    def initialize(arg)
      if arg.respond_to?(:has_key?)
        @key = arg[:key]
        @data = arg
      else
        @key = arg.to_s
      end
    end

    # Name of the color
    # @return [String]
    def name
      data[:name]
    end

    # Alternative names the color may be known by
    # @return [Array]
    def alt
      List.new(data[:alt]).to_a
    end

    validates :key, :key_format => true, :key_lookup => true

    private 
    
    def data
      @data || (I18n.translate("#{TPREFIX}.#{@key}") if defined?(ColorNameI18n::TPREFIX))
    end

  end

end # module ColorNameI18n
