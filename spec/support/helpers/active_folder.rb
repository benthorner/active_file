require 'active_folder'

RSpec.configure do |config|
  config.after(:all) do
    Dir.glob('tmp/*').each { |f| FileUtils.rm_rf(f) }
  end

  config.before(:all) do
    Dir.glob('tmp/*').each { |f| FileUtils.rm_rf(f) }
  end
end

ActiveFolder.setup do |config|
  config.client.root_path = 'tmp'
end

class Model < ActiveFolder::Base
  has_many :model_children
end

class ModelChild < ActiveFolder::Base; end
