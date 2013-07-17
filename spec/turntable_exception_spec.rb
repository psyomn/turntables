require 'turntables/turntable_exception'

describe TurntableException do 

  before(:each) do
    @te = TurntableException.new
  end

  it "Should be an instance of runtime error" do
    @te.should be_a_kind_of(RuntimeError)
  end

  it "should be an instance of TurntableException" do
    @te.should be_an_instance_of(TurntableException)
  end
end
