require 'spec_helper'

describe "rounds/index" do
  before(:each) do
    assign(:rounds, [
      stub_model(Round,
        :POpening => 1,
        :DOpening => 2,
        :PDirectAtt => 3,
        :PDirectWit => 4,
        :DCrossWit => 5,
        :PCrossWit => 6,
        :PClose => 7,
        :DClose => 8
      ),
      stub_model(Round,
        :POpening => 1,
        :DOpening => 2,
        :PDirectAtt => 3,
        :PDirectWit => 4,
        :DCrossWit => 5,
        :PCrossWit => 6,
        :PClose => 7,
        :DClose => 8
      )
    ])
  end

  it "renders a list of rounds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
  end
end
