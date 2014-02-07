module ActiveWarehouse #:nodoc:
  # A field that uses a Proc to calculate the value 
  class CalculatedInSqlField < Field

    attr_reader :block
    attr_reader :strategy_name

    # Initialize the calculated field
    #
    # +fact_class+ is the fact class that the field is calculated in
    # +name+ is the name of the calculated field
    # +type+ is the type of the calculated field (defaults to :integer)
    # +field_options+ is a Hash of options for the field
    # 
    # This method accepts a block which should take a single argument that is the record
    # itself.
    def initialize(fact_class, name, options = {}, &block)
      unless block_given?
        raise ArgumentError, "A block is required for the calculated field #{name} in #{fact_class}"
      end
      @strategy_name = options[:strategy] || :sum
      @type          = options[:type]     || :integer
      @block         = block
      super(fact_class, name, type, options)
    end
    
    def statement
      @block
    end

    def fact_class
      owning_class
    end

    def label
      @label ? @label : "#{super}_#{strategy_name}"
    end
  end
end