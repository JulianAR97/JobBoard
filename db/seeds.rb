# Allow users a limited ability to create tags by seeding popular ones

tag_names = %w[javascript ruby rails node css html c++ bootstrap rust java php python django react typescript
  kotlin c# perl scala swift sql r go matlab]

tag_names.each do |name|
  Tag.create(name: name)
end

# Email gen
adjectives = %w[clumsy crazy devestating distinctive fearless fierce gentle gifted gorgeous hyper prestigious sleepy vivacious]
nouns = %w[actor cat coder goat lion mother mountain mule musician student teacher]
domains = %w[yahoo gmail icloud]

def email_gen(adjectives, nouns, domains)
  "#{adjectives.sample}#{nouns.sample}@#{domains.sample}.com"
end

until User.count == 20 do
  User.create(email: email_gen(adjectives, nouns, domains), password: 'helloworld')
end

# Listing terms generator 
list_a = %w[Engineer Developer Designer Consultant]
list_b = %w[Needed Wanted Required Desired]
skills = %w[beginner intermediate expert] 

def listing_title_gen(list_a, list_b, tag_a, tag_b)
  "#{tag_a}/#{tag_b} #{list_a.sample} #{list_b.sample}"
end

# Until every user has at least 5 listings
until User.all.map(&:listings).map(&:count).none? {|e| e < 5} do
  tags = Tag.all.sample(rand(2..5))
  title = listing_title_gen(list_a, list_b, tags[0].name, tags[1].name)
  word_count = (5..10).to_a.sample * 50
  content = LoremIpsum.w(word_count)
  skill_level = skills.sample
  price = (1..20).to_a.sample * 50
  user = User.all.sample
  listing = user.listings.build(title: title, content: content, skill_level: skill_level, price: price)
  listing.tags << tags
  listing.save
end


