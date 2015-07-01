Given(/^a vsphere server at (.*)$/) do |server|
  @vim = double 'RbVmobi::VIM'
  expect(RbVmomi::VIM).to receive(:connect).and_return @vim
end

Given(/^a dc named (.*)$/i) do |dc|
  @dcdouble = double RbVmomi::VIM::Datacenter, name: dc # RbVmomi::VIM::Datacenter.new dc, dc

  childobj = double 'notsure', find_all: [ @dcdouble ]
  root_folder = double 'something', children: childobj

  allow(@vim).to receive(:rootFolder).and_return root_folder
end

Given(/^the server at (.*?) has a vlan tag (\d+) name (.*)/) do |server, vlan_id, vlan_name|
  network = double 'Network', name: vlan_name
  @networks = if @networks
                @networks.push network
              else
                [network]
              end
  allow(@dcdouble).to receive(:network).and_return(@networks)
end

When(/^I run 'knife (.*)'$/) do |command|

  argv = command.split(/ +/)

  @knife = Chef::Knife.run(argv)
end

Then(/^the output should have (\d+) lines$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

