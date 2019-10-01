RSpec.configure do |c|
  c.before :suite do
    if File.exist?('inventory.yaml')
      inventory_hash = inventory_hash_from_inventory_file
      inventory_hash = add_feature_to_group(inventory_hash, 'puppet-agent', 'ssh_nodes')
      inventory_hash = add_feature_to_group(inventory_hash, 'puppet-agent', 'winrm_nodes')
      inventory_hash = add_feature_to_group(inventory_hash, 'puppet-agent', 'docker_nodes')
      inventory_hash = add_feature_to_group(inventory_hash, 'puppet-agent', 'local')
      write_to_inventory_file(inventory_hash, 'inventory.yaml')
    end
  end
end
