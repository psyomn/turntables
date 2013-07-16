require 'turntables/repository'

include Turntables

describe Repository do 

  before :each do 
    @repo = Repository.new
  end

  it "#new should return Repository Object" do 
    @repo.should be_instance_of Repository
  end

  it "Should have a method called register" do 
    @repo.should respond_to(:register)
  end

  it "Should have a method called make!" do 
    @repo.should respond_to(:make!)
  end

  it "Should have an attribute called sequential_dir" do
    @repo.should respond_to(:sequential_dir)
  end

  it "Should have an attribute called monolithic_dir" do
    @repo.should respond_to(:monolithic_dir)
  end

  it "Should have an attribute called relative_dir" do
    @repo.should respond_to(:relative_dir)
  end

end
