require 'chefspec'

describe 'package::purge' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'purges a package with an explicit action' do
    expect(chef_run).to purge_package('explicit_action')
    expect(chef_run).to_not purge_package('not_explicit_action')
  end

  it 'purges a package with attributes' do
    expect(chef_run).to purge_package('with_attributes').with(version: '1.0.0')
    expect(chef_run).to_not purge_package('with_attributes').with(version: '1.2.3')
  end

  it 'purges a package when specifying the identity attribute' do
    expect(chef_run).to purge_package('identity_attribute')
  end
end
