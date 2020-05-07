require_relative '../lib/00_Dark_Trader'


describe "the scrapping_site method" do

  it "should retun a array" do
    expect(scrapping_site("https://www.thehackingproject.org")).to be_a(Nokogiri::HTML::Document)
  end 
end

describe "the collect_crypto methode" do

  it "should return a array" do
    expect(collect_crypto("https://coinmarketcap.com/all/views/all/")).to be_a(Array)
  end

  it "the first array box should return BTZ" do
   expect(collect_crypto("https://coinmarketcap.com/all/views/all/")).to include("BTC")
  end
end

describe "the collect_value_crypto methode" do

  it "should return a array" do
    expect(collect_value_crypto("https://coinmarketcap.com/all/views/all/")).to be_a(Array)
  end

  it "the first array box should return a Float" do
   expect(collect_value_crypto("https://coinmarketcap.com/all/views/all/")).to include("$")
  end
end

describe "the create_array_of_hash methode" do

  it "should return a array of hash" do
    expect(create_array_of_hash(["btc", "esc", "bdv", "std"], ["$18", "$12.05", "$15,856.35", "$1547.25"])).to eq([{"btc" => 18.0}, {"esc" => 12.05}, {"bdv" => 15856.35}, {"std" => 1547.25}])
  end
end