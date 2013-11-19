require 'spec_helper'

describe "rounds/edit" do
  before(:each) do
    @round = assign(:round, stub_model(Round,
      :POpening => 1,
      :DOpening => 1,
      :PDirectAtt => 1,
      :PDirectWit => 1,
      :DCrossWit => 1,
      :PCrossWit => 1,
      :PClose => 1,
      :DClose => 1
    ))
  end

  it "renders the edit round form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", round_path(@round), "post" do
      assert_select "input#round_POpening[name=?]", "round[POpening]"
      assert_select "input#round_DOpening[name=?]", "round[DOpening]"
      assert_select "input#round_PDirectAtt[name=?]", "round[PDirectAtt]"
      assert_select "input#round_PDirectWit[name=?]", "round[PDirectWit]"
      assert_select "input#round_DCrossWit[name=?]", "round[DCrossWit]"
      assert_select "input#round_PCrossWit[name=?]", "round[PCrossWit]"
      assert_select "input#round_PClose[name=?]", "round[PClose]"
      assert_select "input#round_DClose[name=?]", "round[DClose]"
    end
  end
end
