Given /^I have (\d+) notes?$/ do |num|
  Note.destroy_all
  Given "I have the following notes:", table(
    [%w(title content)] +
    num.to_i.times.map{|i| ["Test Note #{i} #{Time.now.to_i}", "Lorem Ipsum dolololol"]}
  )
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