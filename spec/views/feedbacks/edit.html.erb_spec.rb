require 'rails_helper'

RSpec.describe "feedbacks/edit", type: :view do
  before(:each) do
    @feedback = assign(:feedback, Feedback.create!(
      :message => "MyString",
      :user => nil,
      :meeting => nil
    ))
  end

  it "renders the edit feedback form" do
    render

    assert_select "form[action=?][method=?]", feedback_path(@feedback), "post" do

      assert_select "input#feedback_message[name=?]", "feedback[message]"

      assert_select "input#feedback_user_id[name=?]", "feedback[user_id]"

      assert_select "input#feedback_meeting_id[name=?]", "feedback[meeting_id]"
    end
  end
end
