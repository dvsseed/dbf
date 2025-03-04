module DBF
  class Header
    attr_reader :data
    attr_reader :version
    attr_reader :record_count
    attr_reader :header_length
    attr_reader :record_length
    attr_reader :encoding_key
    attr_reader :encoding

    def initialize(data, set_encoding)
      @data = data
      @version, @record_count, @header_length, @record_length, @encoding_key = unpack_header
      @encoding = DBF::ENCODINGS[@encoding_key] if set_encoding
    end

    def unpack_header
      data.unpack('H2 x3 V v2 x17H2')
    end
  end
end
