# Poll..inator? - Just a Simple Poll Creator

<div align="center">

**Create polls in seconds. Share anywhere. See results in real-time.**

[![Ruby on Rails](https://img.shields.io/badge/Rails-8.0.3-red.svg)](https://rubyonrails.org/)
[![Ruby](https://img.shields.io/badge/Ruby-3.4.7-red.svg)](https://www.ruby-lang.org/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

[Live Demo](#) · [Report Bug](https://github.com/yourusername/pola/issues) · [Request Feature](https://github.com/yourusername/pola/issues)

</div>

---

## Features

- **Lightning Fast** - Create a poll in under 30 seconds
- **Beautiful UI** - Modern, responsive design with Tailwind CSS
- **Real-Time Results** - Live charts and visualizations with Chart.js
- **Easy Sharing** - Unique share links and QR codes for each poll
- **Privacy-Focused** - No sign-up required, IP-based vote tracking
- **Time-Limited Polls** - Optional poll expiration dates
- **Multiple Votes** - Option to allow multiple votes from the same user
- **Mobile Responsive** - Works perfectly on all devices
- **Free Hosting Ready** - Optimized for Render.com, Fly.io, Railway

---

## Screenshots

> **Note:** Add your own screenshots here after deploying!

[Homepage] - [Create Poll] - [Voting Page] - [Results with Charts]

---

## Quick Start

### Prerequisites

- Ruby 3.4+ ([Install Ruby](https://www.ruby-lang.org/en/documentation/installation/))
- Rails 8.0+ (`gem install rails`)
- SQLite3 (for development)
- PostgreSQL (for production - optional)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/pola.git
   cd pola
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   rails db:create db:migrate db:seed
   ```

4. **Install Tailwind CSS**
   ```bash
   rails tailwindcss:install
   ```

5. **Start the development server**
   ```bash
   bin/dev
   ```

6. **Visit the app**
   Open [http://localhost:3000](http://localhost:3000) in your browser

---

## Usage

### Creating a Poll

1. Click "Create Poll" in the navigation
2. Enter your poll question and description
3. Add at least 2 options (up to 10)
4. Configure advanced options:
   - Allow multiple votes
   - Set poll expiration date
5. Click "Create Poll"
6. Share the unique link or QR code!

### Voting on a Poll

1. Open the shared poll link
2. Select your choice
3. Click "Submit Vote"
4. View real-time results with beautiful charts

### Viewing Results

- Results are accessible immediately after voting
- Real-time bar charts powered by Chart.js
- Detailed breakdown with percentages
- Copy share link or download QR code
- Option to vote again (if allowed by poll creator)

---

## Tech Stack

### Backend

- **Ruby on Rails 8.0.3** - Web framework
- **SQLite3** - Development database
- **PostgreSQL** - Production database

### Frontend

- **Tailwind CSS 4.0** - UI styling
- **Chart.js 4.4** - Data visualization
- **Turbo & Stimulus** - Hotwired for interactivity

### Key Gems

- **rqrcode** - QR code generation
- **chartkick** - Chart data formatting

---

## Project Structure

```
pola/
├── app/
│   ├── controllers/
│   │   └── polls_controller.rb     # Main controller
│   ├── models/
│   │   ├── poll.rb                 # Poll model
│   │   ├── option.rb               #Poll option model
│   │   └── vote.rb                 #Vote model
│   └── views/
│       ├── layouts/
│       │   └── application.html.erb #Main layout
│       └── polls/
│           ├── index.html.erb       #Homepage
│           ├── new.html.erb         #Create poll form
│           ├── show.html.erb        #Voting page
│           └── results.html.erb     #Results page
├── config/
│   ├── routes.rb                   #Application routes
│   └── database.yml                #Database configuration
└── db/
    ├── migrate/                    #Database migrations
    └── seeds.rb                    #Sample data
```

---

## Deployment

### Deploy to Render.com (Recommended - 100% Free)

1. **Create a new Web Service** on [Render.com](https://render.com)
2. **Connect your GitHub repository**
3. **Configure settings:**
   - **Build Command:** `bundle install && rails db:migrate`
   - **Start Command:** `rails server -b 0.0.0.0`
   - **Environment:** Ruby
4. **Add PostgreSQL database** (free tier)
5. **Set environment variables:**
   ```
   DATABASE_URL=<your-postgres-url>
   RAILS_ENV=production
   SECRET_KEY_BASE=<generate with: rails secret>
   ```
6. **Deploy!** 

### Alternative Hosting Options

#### Railway.app
```bash
railway init
railway add
railway up
```

#### Fly.io
```bash
fly launch
fly deploy
```

#### Heroku
```bash
heroku create
git push heroku main
heroku run rails db:migrate
```

---

## Configuration

### Environment Variables

For production deployment, set these variables:

```env
DATABASE_URL=postgresql://...          #PostgreSQL connection URL
RAILS_ENV=production                   #Production environment
SECRET_KEY_BASE=your_secret_key       #Generate with: rails secret
RAILS_LOG_TO_STDOUT=true              #For cloud hosting
RAILS_SERVE_STATIC_FILES=true         #Serve static assets
```

### Database

- **Development:** SQLite3 (automatic)
- **Production:** PostgreSQL (recommended)

To switch databases, update `config/database.yml`

---

## Features Breakdown

### Poll Management

- Create unlimited polls
- Add 2-10 options per poll
- Optional descriptions
- Unique shareable URLs
- QR code generation
- Poll expiration dates
- Close polls manually

### Voting System

- IP-based vote tracking
- Single or multiple vote options
- Vote validation
- Duplicate vote prevention
- Closed poll detection

### Results & Analytics

- Real-time vote counting
- Bar chart visualization
- Percentage breakdowns
- Vote count display
- Shareable results page

---

## Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Built with [Ruby on Rails](https://rubyonrails.org/)
- UI powered by [Tailwind CSS](https://tailwindcss.com/)
- Charts by [Chart.js](https://www.chartjs.org/)
- Icons from [Heroicons](https://heroicons.com/)

---

## Contact

**Your Name** - [@yourtwitter](https://twitter.com/yourtwitter) - your.email@example.com

Project Link: [https://github.com/yourusername/pola](https://github.com/yourusername/pola)

---

<div align="center">

**Made with ❤️ using Ruby on Rails**

[⬆ back to top](#-pola---simple-poll-creator)

</div>
