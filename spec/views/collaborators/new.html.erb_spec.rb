require 'rails_helper'

RSpec.describe "collaborators/new", type: :view do
  before(:each) do
    assign(:collaborator, Collaborator.new(
      :user_id => 1
    ))
  end

  it "renders new collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborators_path, "post" do

      assert_select "input#collaborator_user_id[name=?]", "collaborator[user_id]"
    end
  end
end
