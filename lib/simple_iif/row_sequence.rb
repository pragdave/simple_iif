module SimpleIif
  class RowSequence

    def initialize
      @rows = []
    end

    def add(row_type, *row_params, &block)
      new_row = Rows.for(row_type, *row_params)
      @rows << new_row
    end

    def to_iif
      result = []
      @rows.each do |row|
        result << row.headers.join("\t")
      end
      @rows.each do |row|
        result << row.values.join("\t")
      end
      result
    end
  end
end
