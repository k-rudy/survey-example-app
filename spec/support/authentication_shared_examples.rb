shared_examples_for 'user-only for' do |actions|
  actions.each do |action_data|
    action, method, params = extract_action_method_and_params(action_data)

    describe "#{method.to_s.upcase} #{action}" do

      describe_user_only_context(action, method, params)
    end
  end
end

def extract_action_method_and_params(action_data)
  if action_data.is_a? Symbol
    [action_data, :get]
  else
    params = action_data.slice(:params)[:params]
    action_data.to_a.first << params
  end
end

def describe_user_only_context(action, method, params)

  context 'when user is not logged in' do

    it 'redirects to the login page' do
      send(method, action, params)
      expect(response).to redirect_to(:login)
      expect(flash[:alert]).to be_present
    end
  end
end

