module ColorNameI18n

  # @return [Array] Array of [String] elements of each color key in the locale
  def self.keys
    if defined?(TPREFIX)
      data = I18n.translate(TPREFIX)
      if data.respond_to?(:keys)
        return data.keys.map{|k| k.to_s}
      end
    end
    []
  end

  # Convert a delimited list to an array 
  # 
  class List

    include Enumerable

    # @param [String, to_s] data String with data elements
    # @param [String, to_s] delimiter delimiter to split data elements
    def initialize(data, delimiter = ',')
      @data = data.to_s
      @delim = delimiter.to_s
    end

    # @return [Array]
    def to_a
      @data.split(@delim)
    end

    def each
      self.to_a.each do |s|
        yield s
      end
    end #each

  end

end
