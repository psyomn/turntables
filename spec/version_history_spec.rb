# frozen_string_literal: true

require 'turntables/version_history'

describe VersionHistory do
  context '<<AR>> pattern specification' do
    it 'should respond to class method check' do
      expect(VersionHistory).to respond_to(:check)
    end

    it 'should respond to class method find_all' do
      expect(VersionHistory).to respond_to(:find_all)
    end

    it 'should respond to class method find_last' do
      expect(VersionHistory).to respond_to(:find_last)
    end

    it 'should respond to class method find' do
      expect(VersionHistory).to respond_to(:find)
    end

    it 'should respond to class method insert' do
      expect(VersionHistory).to respond_to(:insert)
    end

    it 'should respond to class method pull_up!' do
      expect(VersionHistory).to respond_to(:pull_up!)
    end

    it 'should respond to class method to_version_history' do
      expect(VersionHistory).to respond_to(:to_version_history)
    end
  end

  context 'Attributes' do
    before(:each) do
      @version_history = VersionHistory.new(1, 'asdf')
    end

    it 'should have an id' do
      expect(@version_history).to respond_to(:id)
    end

    it 'should have a version' do
      expect(@version_history).to respond_to(:version)
    end

    it 'should have a date' do
      expect(@version_history).to respond_to(:date)
    end

    it 'should have a comment' do
      expect(@version_history).to respond_to(:comment)
    end
  end
end
