require 'rails_helper'

RSpec.describe "meetings/new", type: :view do
  before(:each) do
    assign(:meeting, Meeting.new(
      :name => "MyString",
      :user => nil,
      :room => nil
    ))
  end

  it "renders new meeting form" do
    render

    assert_select "form[action=?][method=?]", meetings_path, "post" do

      assert_select "input#meeting_name[name=?]", "meeting[name]"

      assert_select "input#meeting_user_id[name=?]", "meeting[user_id]"

      assert_select "input#meeting_room_id[name=?]", "meeting[room_id]"
    end
  end
end
