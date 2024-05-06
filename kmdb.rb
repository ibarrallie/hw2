# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all 
Actor.destroy_all 
Role.destroy_all 

# Generate models and tables, according to the domain model.
# TODO!
#I did this in the terminal because it wouldn't work here, but the code is:
#rails generate model Studio, e.g.
#then migrate with rails db:migrate


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
#add this with creating new models and adding like normal

#studios
wb = Studio.new

wb["name"] = "Warner Bros."

wb.save

#movies
bb = Movie.new

bb["title"] = "Batman Begins"
bb["year"] = 2005
bb["rated"] = "PG-13"

wbs = Studio.find_by({"name" => "Warner Bros."})

bb["studio_id"] = wbs["id"]

bb.save

dk = Movie.new

dk.title = "The Dark Knight"
dk.year = 2008
dk.rated = "PG-13"
dk.studio_id = wbs["id"]

dk.save

dkr = Movie.new

dkr.title = "The Dark Knight Rises"
dkr.year = 2012
dkr.rated = "PG-13"
dkr.studio_id = wbs["id"]

dkr.save

#actors
cb = Actor.new

cb.name = "Christian Bale"

cb.save

mc = Actor.new

mc.name = "Michael Caine"

mc.save

ln = Actor.new

ln.name = "Liam Neeson"

ln.save

kh = Actor.new

kh.name = "Katie Holmes"

kh.save

go = Actor.new

go.name = "Gary Oldman"

go.save

hl = Actor.new

hl.name = "Heath Ledger"

hl.save

ae = Actor.new

ae.name = "Aaron Eckhart"

ae.save

th = Actor.new

th.name = "Tom Hardy"

th.save

ah = Actor.new

ah.name = "Anne Hathaway"

ah.save

#roles
#all the bruce wayne ones
bw = Role.new

bb = Movie.find_by({"title" => "Batman Begins"})

bw.movie_id = bb["id"]

cb = Actor.find_by({"name" => "Christian Bale"})

bw.actor_id = cb["id"]
bw.character = "Bruce Wayne"

bw.save

bw2 = Role.new

tdk = Movie.find_by({"title" => "The Dark Knight"})

bw2.movie_id = tdk["id"]
bw2.actor_id = cb["id"]
bw2.character = "Bruce Wayne"

bw2.save

bw3 = Role.new

tdkr = Movie.find_by({"title" => "The Dark Knight Rises"})

bw3.movie_id = tdkr["id"]
bw3.actor_id = cb["id"]
bw3.character = "Bruce Wayne"

bw3.save

#all the Alfreds

ap = Role.new

mc = Actor.find_by({"name" => "Michael Caine"})

ap.movie_id = bb["id"]
ap.actor_id = mc["id"]
ap.character = "Alfred"

ap.save

ap2 = Role.new

ap2.movie_id = tdk["id"]
ap2.actor_id = mc["id"]
ap2.character = "Alfred"

ap2.save

ap3 = Role.new 

ap3.movie_id = tdkr["id"]
ap3.actor_id = mc["id"]
ap3.character = "Alfred"

ap3.save

#Liam

rg = Role.new

ln = Actor.find_by({"name" => "Liam Neeson"})

rg.movie_id = bb["id"]
rg.actor_id = ln["id"]
rg.character = "Ras al Gul"

rg.save

#both Rachels

rd = Role.new

kh = Actor.find_by({"name" => "Katie Holmes"})

rd.movie_id = bb["id"]
rd.actor_id = kh["id"]
rd.character = "Rachel Dawes"

rd.save

rd2 = Role.new

rd2.movie_id = tdk["id"]
rd2.actor_id = kh.id
rd2.character = "Rachel Dawes"

rd2.save

#all the gordons

cg = Role.new

ga = Actor.find_by({"name" => "Gary Oldman"})

cg.movie_id = bb.id
cg.actor_id = ga.id
cg.character = "Comm Gordon"

cg.save

cg2 = Role.new

cg2.movie_id = tdk.id
cg2.actor_id = ga.id
cg2.character = "Comm Gordon"

cg2.save

cg3 = Role.new

cg3.movie_id = tdkr.id
cg3.actor_id = ga.id
cg3.character = "Comm Gordon"

cg3.save

#joker

jk = Role.new

hl = Actor.find_by({"name" => "Heath Ledger"})

jk.movie_id = bb.id
jk.actor_id = hl.id
jk.character = "Joker"

jk.save

#harvey
hd = Role.new

ae = Actor.find_by({"name" => "Aaron Eckhart"})

hd.movie_id = tdk.id
hd.actor_id = ae.id
hd.character = "Harvey Dent"

hd.save

#bane

bn = Role.new

th = Actor.find_by({"name" => "Tom Hardy"})

bn.movie_id = tdkr.id
bn.actor_id = th.id
bn.character = "Bane"

bn.save

#catwoman

cw = Role.new

ah = Actor.find_by({"name" => "Anne Hathaway"})

cw.movie_id = tdkr.id
cw.actor_id = ah.id
cw.character = "Cat Woman"

cw.save

# Prints a header for the movies output
movies = Movie.all

puts "Movies"
puts "======"
for title in movies
puts "#{title.title}"
end
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
actors = Actor.all
casts = Role.all
movies = Movie.all

puts ""
puts "Top Cast"
for 


end

puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
