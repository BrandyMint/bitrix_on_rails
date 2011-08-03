module BitrixOnRails
  class Engine < Rails::Engine
    initializer 'bitrix_on_rails.init' do
      BitrixOnRails.init
    end
  end
end
