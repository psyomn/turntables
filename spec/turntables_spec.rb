# frozen_string_literal: true

require 'spec_helper'
require 'turntables'

describe Turntables do
  it 'should have a VERSION constant' do
    expect(subject.const_get('VERSION')).to_not be_empty
  end
end
