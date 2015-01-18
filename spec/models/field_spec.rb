describe ActiveWarehouse::Field do
  
  before(:each) do
    @field = ActiveWarehouse::AggregateField.new(StoreInventorySnapshotFact, 
        StoreInventorySnapshotFact.columns_hash["quantity_sold"])
    @decimal_field = ActiveWarehouse::AggregateField.new(StoreInventorySnapshotFact,
        StoreInventorySnapshotFact.columns_hash["dollar_value_at_latest_selling_price"])
  end
  
  describe "#name" do
    it "returns the field's name" do
      @field.name.should == "quantity_sold"
    end
  end
  
  describe "#column_type" do
    it "returns the field's column type" do
      @field.column_type.should == :integer
    end
  end
  
  describe "#scale" do
    context "when column scale is undefined" do
      it "returns nil" do
        @field.scale.should be_nil
      end
    end
    
    context "when column scale is defined" do
      it "returns the field's column scale" do
        @decimal_field.scale.should == 2
      end
    end
  end
  
  describe "#precision" do
    context "when column precision is undefined" do
      it "returns nil" do
        @field.precision.should be_nil
      end
    end
  
    context "when column precision is defined" do
      it "returns the field's column precision" do
        @decimal_field.precision.should == 18
      end
    end
  end

  describe "#from_table_name" do
    it "returns the name of the field's parent table" do
      @field.from_table_name.should == "store_inventory_snapshot_facts"
    end
  end

  describe "#owning_class" do
    it "returns the class of the field's parent table" do
      @field.owning_class.should == StoreInventorySnapshotFact
    end
  end

  # columns_hash seems to have no #type_cast anymore in Rails 4.x
  #describe "#type_cast" do
  #  it "returns the field's column type_cast" do
  #    expected_value = StoreInventorySnapshotFact.columns_hash["quantity_sold"].type_cast(1)
  #    expect(@field.type_cast(1)).to eq(expected_value)
  #  end
  #end

  describe "#field_options" do
    it "returns the fields options hash" do
      @field = ActiveWarehouse::AggregateField.new(StoreInventorySnapshotFact,
          StoreInventorySnapshotFact.columns_hash["quantity_sold"], strategy: :sum, label: 'My Field')
      @field.field_options.should == {strategy: :sum, label: 'My Field'}
    end
  end
  
  describe "#strategy" do
    it "returns the value of the strategy option" do
      @field = ActiveWarehouse::AggregateField.new(StoreInventorySnapshotFact,
        StoreInventorySnapshotFact.columns_hash["quantity_sold"], strategy: :sum, label: 'My Field')
      @field.strategy.should == :sum
    end
  end

  describe "#label" do
    it "returns the value of the label option" do
      @field = ActiveWarehouse::AggregateField.new(StoreInventorySnapshotFact,
        StoreInventorySnapshotFact.columns_hash["quantity_sold"], strategy: :sum, label: 'My Field')
      @field.label.should == 'My Field'
    end
  end

  describe "#default_label" do
    it "returns a default label 'fact_table_field_name_aggregate_function'" do
      @field.label.should == "store_inventory_snapshot_facts_quantity_sold_sum"
    end
  end
  
  describe "#label_for_table" do
    it "returns the value of the label option in downcase/underscore format" do
      @field = ActiveWarehouse::AggregateField.new(StoreInventorySnapshotFact,
        StoreInventorySnapshotFact.columns_hash["quantity_sold"], strategy: :sum, label: 'My Sum')
      @field.label_for_table.should == "my_sum"
    end
  end
  
end
