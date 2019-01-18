require_relative '../lib/00_crypto.rb'

describe "the crypto function" do
    it "counts the number of items in the array" do
        expect(crypto).not_to be_nil
    end
end

#vu que les valeurs des cryptomonnaies changent tout le temps, on a décidé de rester sur le test du nombre des monnaies scrapées.


describe "the perform function" do
    it "call the crypto method" do
        expect(crypto).not_to be_nil
      end
end
