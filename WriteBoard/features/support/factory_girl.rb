FactoryGirl.define do
  factory :user, :aliases => [:author] do
    sequence :email do |n|
      "person_#{n}@people.test"
    end
    password '123456'
    password_confirmation {"#{password}"}
  end

  factory :message do
    author
    sequence :content do |n|
      "message number #{n}"
    end
  end
  
  factory :reply, :class => Message do
    author
    sequence :content do |n|
      "reply number #{n}"
    end
  end
end