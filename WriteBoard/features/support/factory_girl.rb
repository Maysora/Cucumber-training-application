FactoryGirl.define do
  factory :user do
    email 'aya@seiyuu.test'
    password '123456'
    password_confirmation {"#{password}"}
  end
end