# frozen_string_literal: true

require 'turntables/constants/repository_constants'

describe Turntables::RepositoryConstants do
  it 'Should have SeqDir constant' do
    expect(subject.const_get('SEQ_DIR')).to_not be_empty
  end

  it 'Should have MonoDir constant' do
    expect(subject.const_get('MONO_DIR')).to_not be_empty
  end
end
