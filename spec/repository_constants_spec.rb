require 'turntables/constants/repository_constants'

include Turntables

describe RepositoryConstants do
  it "Should have SeqDir constant" do
    subject.const_get('SeqDir').should_not be_empty
  end

  it "Should have MonoDir constant" do
    subject.const_get('MonoDir').should_not be_empty
  end
end
