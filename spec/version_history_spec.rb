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
end
