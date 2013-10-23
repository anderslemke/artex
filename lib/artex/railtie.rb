require 'artex/framework/rails'
module ArTeX
  class Railtie < Rails::Railtie
    initializer 'artex.setup' do
      ArTeX::Framework::Rails.setup
    end
  end
end
