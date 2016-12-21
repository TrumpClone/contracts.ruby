RSpec.describe "Contracts::ErrorFormatters" do
  before :all do
    @o = GenericExample.new
  end

  describe "self.class_for" do
    it "returns the right formatter for passed in data" do
    end
  end

  def format_message(str)
    str.split("\n").map(&:strip).join("\n")
  end

  def fails(msg, &block)
    expect { block.call }.to raise_error do |e|
      expect(e).to be_a(ParamContractError)
      expect(format_message(e.message)).to include(format_message(msg))
    end
  end

  describe "self.failure_msg" do
    it "includes normal information" do
      msg = %{Contract violation for argument 1 of 1:
                            Expected: (KeywordArgs[{:name=>String, :age=>Fixnum}])
                            Actual: {:age=>"2", :invalid_third=>1}
                            Missing Contract: {:invalid_third=>1}
                            Invalid Args: [{:age=>"2", :contract=>Fixnum}]
                            Missing Args: {:name=>String}
                            Value guarded in: GenericExample::simple_keywordargs
                            With Contract: KeywordArgs => NilClass}
      fails msg do
        @o.simple_keywordargs(:age => "2", :invalid_third => 1)
      end
    end

    it "includes Missing Contract information" do
      fails %{Missing Contract: {:invalid_third=>1, :invalid_fourth=>1}} do
        @o.simple_keywordargs(:age => "2", :invalid_third => 1, :invalid_fourth => 1)
      end
    end

    it "includes Invalid Args information" do
      fails %{Invalid Args: [{:age=>"2", :contract=>Fixnum}]} do
        @o.simple_keywordargs(:age => "2", :invalid_third => 1)
      end
    end

    it "includes Missing Args information" do
      fails %{Missing Args: {:name=>String}} do
        @o.simple_keywordargs(:age => "2", :invalid_third => 1)
      end
    end
  end
end
