require 'spec_helper'

describe "user_sessions/new.html.erb" do

  it 'renders the login form' do
    render

    assert_select "form[action=?][method=?]", user_sessions_path, "post" do
      assert_select "input#email[name=email]"
      assert_select "input#password[name=password]"
      assert_select "input#remember_me[name=remember_me]"
    end
  end

  it 'renders flash messages' do
    flash[:notice] = 'Test'
    render

    assert_select '.alert' do |div|
      expect(div.to_s).to include('Test')
    end
  end
end
