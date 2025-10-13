# Clear existing data in development
if Rails.env.development?
  Vote.destroy_all
  Option.destroy_all
  Poll.destroy_all
  puts "Cleared existing polls, options, and votes"
end

# Sample Polls
puts "Creating sample polls..."

# Poll 1: Programming Languages
poll1 = Poll.create!(
  title: "What's your favorite programming language?",
  description: "Vote for your preferred language for web development in 2024",
  allow_multiple: false
)

poll1.options.create!([
  { title: "Ruby", vote_count: 15 },
  { title: "Python", vote_count: 23 },
  { title: "JavaScript", vote_count: 31 },
  { title: "Go", vote_count: 12 },
  { title: "Rust", vote_count: 8 }
])

# Poll 2: Favorite Framework
poll2 = Poll.create!(
  title: "Best Web Framework for 2024?",
  description: "Which framework are you most excited about?",
  allow_multiple: false
)

poll2.options.create!([
  { title: "Ruby on Rails", vote_count: 18 },
  { title: "Django", vote_count: 14 },
  { title: "Next.js", vote_count: 27 },
  { title: "Laravel", vote_count: 11 }
])

# Poll 3: Code Editor
poll3 = Poll.create!(
  title: "Which code editor do you use?",
  description: "Share your daily driver for coding",
  allow_multiple: false
)

poll3.options.create!([
  { title: "VS Code", vote_count: 45 },
  { title: "Vim/Neovim", vote_count: 12 },
  { title: "Sublime Text", vote_count: 7 },
  { title: "IntelliJ IDEA", vote_count: 16 },
  { title: "Other", vote_count: 5 }
])

# Poll 4: Remote Work
poll4 = Poll.create!(
  title: "Do you prefer remote work or office?",
  allow_multiple: false
)

poll4.options.create!([
  { title: "Fully Remote", vote_count: 38 },
  { title: "Hybrid (2-3 days office)", vote_count: 25 },
  { title: "Fully In-Office", vote_count: 9 },
  { title: "Flexible/No Preference", vote_count: 13 }
])

# Poll 5: Closed Poll Example
poll5 = Poll.create!(
  title: "Favorite Pizza Topping?",
  description: "This poll has been closed",
  allow_multiple: false,
  closes_at: 1.day.ago
)

poll5.options.create!([
  { title: "Pepperoni", vote_count: 42 },
  { title: "Mushrooms", vote_count: 18 },
  { title: "Pineapple", vote_count: 12 },
  { title: "Extra Cheese", vote_count: 28 }
])

puts "✅ Created #{Poll.count} polls with #{Option.count} total options"
puts "🎉 Seed data loaded successfully!"
