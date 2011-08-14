Given /^I have (\d+) notes?$/ do |num|
  Note.destroy_all
  num.to_i.times do |i|
    Note.create!(
      :title => "Test Note #{i} #{Time.now.to_i}",
      :content => "Lorem Ipsum dolololol"
    )
  end
end

Given /^I have the following notes?:$/ do |table|
  table.hashes.each do |note_hash|
    Note.create! note_hash
  end
end

Then /^I should see (\d+) notes? title$/ do |num|
  notes = Note.all
  notes.length.should == num.to_i
  notes.each do |note|
    Then "I should see \"#{note.title}\""
  end
end

Then /^I should have (\d+) notes?$/ do |num|
  Note.all.size.should == num.to_i
end