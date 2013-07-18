require 'turntables/version_history'

describe VersionHistory do 
  context "<<AR>> pattern specification" do
    it "should respond to class method check" do
      VersionHistory.should respond_to(:check)
    end

    it "should respond to class method find_all" do
      VersionHistory.should respond_to(:find_all)
    end

    it "should respond to class method find_last" do
      VersionHistory.should respond_to(:find_last)
    end

    it "should respond to class method find" do
      VersionHistory.should respond_to(:find)
    end

    it "should respond to class method insert" do
      VersionHistory.should respond_to(:insert)
    end

    it "should respond to class method pull_up!" do
      VersionHistory.should respond_to(:pull_up!)
    end
    
    it "should respond to class method to_version_history" do
      VersionHistory.should respond_to(:to_version_history)
    end
  end

  context "Attributes" do
    before(:each) do
      @version_history = VersionHistory.new(1,"asdf")
    end

    it "should have an id" do 
      @version_history.should respond_to(:id)
    end

    it "should have a version" do
      @version_history.should respond_to(:version)
    end

    it "should have a date" do 
      @version_history.should respond_to(:date)
    end

    it "should have a comment" do
      @version_history.should respond_to(:comment)
    end
  end
end
