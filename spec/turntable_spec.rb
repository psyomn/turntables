# frozen_string_literal: true

require 'turntables'
require 'turntables/db_registry'

# This test to see if simple operations work with the application (so that the
# minimal guarantee of the gem is respected - to at least create the schema
# specified).
describe Turntables::Turntable do
  def delete_db
    File.delete('default.db') if File.exist? 'default.db'
  end

  before(:each) do
    @turntable = Turntables::Turntable.new
    @relpath   = __dir__
    @datapath  = "#{@relpath}/data"

    # datapath/ and
    #   malformed-dir
    #   sql-just-monolithic
    #   sql-just-sequential
    #   sql-seq-and-mono
  end

  after(:each) do
    Turntables::DbRegistry.instance.close!
    delete_db
    Turntables::DbRegistry.instance.open!
  end

  after(:all) do
    delete_db
  end

  it 'should raise no errors on a pure sequential repo' do
    @turntable.register("#{@datapath}/sql-just-sequential")
    expect { @turntable.make! }.to_not raise_error
  end

  it 'should raise no errors on a pure monolithic repo' do
    @turntable.register("#{@datapath}/sql-just-monolithic")
    expect { @turntable.make! }.to_not raise_error
  end

  it 'should raise no errors on a mixed repo' do
    @turntable.register("#{@datapath}/sql-seq-and-mono")
    expect { @turntable.make! }.to_not raise_error
  end

  it 'should raise an error on a malformed dir' do
    @turntable.register("#{@datapath}/malformed-dir")
    expect { @turntable.make! }.to raise_error(Turntables::TurntableException)
  end

  it 'should raise an error on non existant path' do
    @turntable.register('WARGABLLGABHLGABL')
    expect { @turntable.make! }.to raise_error(Turntables::TurntableException)
  end

  it 'should create the database at a *specified* location' do
    db_location = "#{@datapath}/locations/herp.db"
    @turntable.register("#{@datapath}/sql-seq-and-mono")
    @turntable.make_at!(db_location)
    expect(File.exist?(db_location)).to be_truthy
    File.delete(db_location)
  end
end
