require 'rails_helper'

RSpec.describe "feedbacks/index", type: :view do
  before(:each) do
    assign(:feedbacks, [
      Feedback.create!(
        :message => "Message",
        :user => nil,
        :meeting => nil
      ),
      Feedback.create!(
        :message => "Message",
        :user => nil,
        :meeting => nil
      )
    ])
  end

  it "renders a list of feedbacks" do
    render
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
