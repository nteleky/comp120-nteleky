require 'spec_helper'

describe "rounds/show" do
  before(:each) do
    @round = assign(:round, stub_model(Round,
      :POpening => 1,
      :DOpening => 2,
      :PDirectAtt => 3,
      :PDirectWit => 4,
      :DCrossWit => 5,
      :PCrossWit => 6,
      :PClose => 7,
      :DClose => 8
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
  end
end
