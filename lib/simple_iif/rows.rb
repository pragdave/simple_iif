require_relative 'row_sequence'

module SimpleIif
  class Rows

    # Load in the subclasses defining each row type
    ROWS = {}

    def self.register(row_type)
      ROWS[row_type] = self
      self.instance_eval %{
        def row_type
          "#{row_type}"
        end
      }
    end

    class << self
      def required_fields
        @required_fields ||= @all_fields.grep(/^\*/).map {|f| f[1..-1] }
      end

      def optional_fields
        @optional_fields ||= @all_fields.grep(/^ /).map {|f| f[1..-1] }
      end

    end

    row_definitions = Dir.chdir(File.join(File.dirname(__FILE__))) { Dir.glob("rows/*.rb")}
    row_definitions.each do |row|
      require_relative row
    end

    # An an object that represents a set of transaction rows
    def self.sequence
      RowSequence.new
    end

    # Factory that returns a new row for a given type
    def self.for(row, *args)
      if cls = ROWS[row.to_s.upcase]
        cls.new(*args)
      else
        fail "Don't know about row #{row.inspect}"
      end
    end


    # Now the instance stuff

    attr_reader :data

    def initialize(values = {})
      @data = {}
      values.each do |key, value|
        key = key.to_s.upcase
        if valid_field?(key)
          @data[key] = value
        else
          puts self.class.required_fields.sort
          puts "----"
          puts self.class.optional_fields.sort
          fail "Row type #{self.class.row_type} does not have a field #{key}"
        end
      end
      check_all_required_fields_present
    end

    def valid_field?(field_name)
      self.class.required_fields.include?(field_name) ||
      self.class.optional_fields.include?(field_name)
    end

    def headers
      ["!#{self.class.row_type}"] + @data.keys.sort
    end

    def values
      ["#{self.class.row_type}"] + @data.keys.sort.map {|k| @data[k]}
    end

    def to_iif
      [ headers.join("\t"), values.join("\t") ]
    end

    private

    def check_all_required_fields_present
      missing = self.class.required_fields.select {|f| !@data.has_key?(f) }
      unless missing.empty?
        fail "Missing required fields: #{missing.join(', ')}"
      end
    end
  end
end
