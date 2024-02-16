module Spree
  module Adyen
    class Engine < ::Rails::Engine
      engine_name "spree-adyen"

      isolate_namespace Spree::Adyen

      initializer "spree.spree-adyen.payment_methods", :after => "spree.register.payment_methods" do |app|
        app.config.spree.payment_methods << Spree::Gateway::AdyenPayment
        app.config.spree.payment_methods << Spree::Gateway::AdyenHPP
        app.config.spree.payment_methods << Spree::Gateway::AdyenPaymentEncrypted
      end

      initializer "spree-adyen.assets.precompile", :group => :all do |app|
        app.config.assets.precompile += %w[
          adyen.encrypt.js
        ]
      end
    end
  end
end
