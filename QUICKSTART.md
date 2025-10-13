# ⚡ Quick Start Guide

Get Pola running on your machine in **under 5 minutes**!

## 🎯 Prerequisites

Ensure you have:
- Ruby 3.4 or higher
- Rails 8.0 or higher
- Git

## 🚀 Installation (4 Steps)

### 1. Clone & Navigate
```bash
git clone <your-repo-url>
cd I-Am-Inhibited-by-a-Cry
```

### 2. Install Dependencies
```bash
bundle install
```

### 3. Setup Database
```bash
rails db:create db:migrate db:seed
```

### 4. Start Server
```bash
bin/dev
```

**That's it!** Open [http://localhost:3000](http://localhost:3000) 🎉

---

## 🎮 Try It Out

### Create Your First Poll

1. Click **"Create Poll"** in the navigation
2. Enter a question: *"What's your favorite color?"*
3. Add options: *Red, Blue, Green, Yellow*
4. Click **"Create Poll"**
5. Share the link and vote!

### Explore Sample Polls

The seed data includes 5 sample polls. Check them out on the homepage!

---

## 🔍 Project Features

**What you can do:**
- ✅ Create unlimited polls
- ✅ Add 2-10 options per poll
- ✅ Vote on polls (IP-based tracking)
- ✅ View real-time results with charts
- ✅ Share polls via links or QR codes
- ✅ Set poll expiration dates
- ✅ Allow/disallow multiple votes

---

## 📂 Project Structure

```
Key Files:
├── app/controllers/polls_controller.rb  # Main logic
├── app/models/                         # Poll, Option, Vote
├── app/views/polls/                    # UI templates
├── config/routes.rb                    # URL routes
└── db/seeds.rb                         # Sample data
```

---

## 🎨 Customization

### Change App Name
Edit `config/application.rb`:
```ruby
module YourAppName
  class Application < Rails::Application
    # ...
  end
end
```

### Modify Branding
Edit `app/views/layouts/application.html.erb`:
- Logo and title in navbar
- Footer text
- Color scheme (Tailwind classes)

### Add More Sample Polls
Edit `db/seeds.rb` and run:
```bash
rails db:seed
```

---

## 🚀 Deploy to Production

### Option 1: Render.com (Recommended)
```bash
# Follow instructions in DEPLOYMENT.md
# Takes ~10 minutes for first deployment
```

### Option 2: One-Click Deploy
Click the deploy button in README.md (once set up)

---

## 🐛 Troubleshooting

**Server won't start?**
```bash
# Kill any process using port 3000
lsof -ti:3000 | xargs kill -9

# Restart server
bin/dev
```

**Database errors?**
```bash
# Reset database
rails db:drop db:create db:migrate db:seed
```

**Assets not loading?**
```bash
# Rebuild Tailwind CSS
rails tailwindcss:build
```

---

## 📚 Next Steps

- Read the full [README.md](README.md)
- Check out [DEPLOYMENT.md](DEPLOYMENT.md) for hosting
- Review [CONTRIBUTING.md](CONTRIBUTING.md) to contribute
- Star the repository if you like it! ⭐

---

## 💬 Need Help?

- Open an issue on GitHub
- Check existing issues for solutions
- Review Rails documentation

**Happy polling! 🎉**
