require 'factory_girl'

FactoryGirl.define do

  factory :user do
    email 'test_user@curate.com'
    password 'valid_pass'
    password_confirmation 'valid_pass'
  end
  
  factory :survey do
    email 'test@mail.com'
  end
end