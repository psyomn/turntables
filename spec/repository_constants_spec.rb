# frozen_string_literal: true

require 'turntables/constants/repository_constants'

include Turntables

describe RepositoryConstants do
  it 'Should have SeqDir constant' do
    expect(subject.const_get('SeqDir')).to_not be_empty
  end

  it 'Should have MonoDir constant' do
    expect(subject.const_get('MonoDir')).to_not be_empty
  end
end
