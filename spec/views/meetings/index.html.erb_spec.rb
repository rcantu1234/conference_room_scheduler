require 'rails_helper'

RSpec.describe "meetings/index", type: :view do
  before(:each) do
    assign(:meetings, [
      Meeting.create!(
        :name => "Name",
        :user => nil,
        :room => nil
      ),
      Meeting.create!(
        :name => "Name",
        :user => nil,
        :room => nil
      )
    ])
  end

  it "renders a list of meetings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
