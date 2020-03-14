# frozen_string_literal: true

require 'turntables/turntable_exception'

describe Turntables::TurntableException do
  before(:each) do
    @te = TurntableException.new
  end

  it 'Should be an instance of runtime error' do
    expect(@te).to be_a_kind_of(RuntimeError)
  end

  it 'should be an instance of TurntableException' do
    expect(@te).to be_an_instance_of(TurntableException)
  end
end
