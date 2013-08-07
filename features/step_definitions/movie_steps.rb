# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
	#debugger
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	Movie.create(movie)
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
	debugger
	(page.body.index(e1)<page.body.index(e2)).should == true
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
	#debugger
	
	if uncheck.nil?
		rating_list.split(",") do |rating|
			check(rating)
		end
	else
		rating_list.split(",") do |rating|
			uncheck(rating)
		end
	end
end

Then /I should see (.*) of the movies/ do |qualifier|
	#debugger
	if qualifier.eql?("all")
		Movie.count.should == 10
	else
		if qualifier.eql?("none")
			Movie.count.should == 0
		end
	end
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #flunk "Unimplemented"
end



