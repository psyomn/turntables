require 'turntables/repository'

include Turntables

describe Repository do

  before :each do
    @repo = Repository.new
  end

  it "#new should return Repository Object" do
    expect(@repo).to be_instance_of Repository
  end

  it "Should have a method called register" do
    expect(@repo).to respond_to(:register)
  end

  it "Should have a method called make!" do
    expect(@repo).to respond_to(:make!)
  end

  it "Should have an attribute called sequential_dir" do
    expect(@repo).to respond_to(:sequential_dir)
  end

  it "Should have an attribute called monolithic_dir" do
    expect(@repo).to respond_to(:monolithic_dir)
  end

  it "Should have an attribute called relative_dir" do
    expect(@repo).to respond_to(:relative_dir)
  end

  it "should have the transactions in a sorted order (smallest to biggest)" do
    @repo.register("./spec/data/sql-just-sequential")
    versions = @repo.transactions.map { |el| el.version }
    versions_dup = versions.dup
    expect(versions.sort == versions_dup).to be_truthy
  end
end
