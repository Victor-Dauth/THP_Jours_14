require_relative '../lib/01_mairie_christmas'


describe "the get_townhall_emails method" do

  it "should retun a array of email" do
    expect(get_townhall_emails(["https://www.annuaire-des-mairies.com/95/baillet-en-france.html","https://www.annuaire-des-mairies.com/95/avernes.html"])).to eq(["info@baillet-en-france.fr","mairie.avernes@orange.fr"])
  end 
end

describe "the get_townhall_names method" do

  it "should return a array" do
    expect(get_townhall_names("https://www.annuaire-des-mairies.com/val-d-oise.html")).to be_a(Array)
  end

  it "should return a array with all town" do
    expect(get_townhall_names("https://www.annuaire-des-mairies.com/val-d-oise.html").length).to eq(185)
  end
end

describe "the get_townhall_sites method" do

  it "should return a array" do
    expect(get_townhall_sites("https://www.annuaire-des-mairies.com/val-d-oise.html")).to be_a(Array)
  end

  it "should return a array with all site town" do
    expect(get_townhall_sites("https://www.annuaire-des-mairies.com/val-d-oise.html").length).to eq(185)
  end 

end