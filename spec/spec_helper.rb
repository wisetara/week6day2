require 'active_record'
require 'rspec'
require 'shoulda-matchers'
require 'product'
require 'cashier'
require 'purchase'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after (:each) do
    Product.all.each { |product| product.destroy }
    Cashier.all.each { |cashier| cashier.destroy }
    Purchase.all.each { |purchase| purchase.destroy }
  end
end

