# Changelog

All notable changes to Pola will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-10-13

### 🎉 Initial Release

#### Added
- **Core Features**
  - Create polls with customizable questions and options
  - Vote on polls with IP-based tracking
  - Real-time results with Chart.js visualizations
  - Unique shareable URLs for each poll
  - QR code generation for easy sharing
  - Poll expiration/closing functionality
  - Option to allow multiple votes from same user

- **UI/UX**
  - Modern, responsive design with Tailwind CSS 4.0
  - Beautiful gradient colors and animations
  - Mobile-friendly interface
  - Smooth transitions and hover effects
  - Flash messages for user feedback
  - Loading states and error handling

- **Technical**
  - Ruby on Rails 8.0.3 backend
  - SQLite3 for development
  - PostgreSQL support for production
  - RESTful API design
  - Secure vote tracking
  - Database migrations
  - Seed data with sample polls

- **Deployment**
  - Render.com configuration (render.yaml)
  - Railway.app support
  - Fly.io compatibility
  - Heroku ready
  - Build scripts for production
  - Environment variable setup

- **Documentation**
  - Comprehensive README with badges
  - Deployment guide for multiple platforms
  - Quick start guide
  - Contributing guidelines
  - MIT License
  - Code of conduct

#### Features Breakdown

**Poll Creation:**
- Title (required, 3-200 characters)
- Description (optional)
- 2-10 options per poll
- Allow multiple votes toggle
- Optional expiration date/time
- Auto-generated unique share codes

**Voting:**
- One-click voting interface
- IP-based duplicate prevention
- Real-time vote counting
- Validation for closed polls
- Redirect to results after voting

**Results:**
- Live bar charts with Chart.js
- Percentage calculations
- Vote count display
- Detailed breakdown by option
- Copy share link button
- QR code download
- Return to voting option

**Sharing:**
- Unique URL for each poll
- QR code generation with rqrcode
- One-click link copying
- Mobile-friendly sharing

#### Security
- CSRF protection
- SQL injection prevention
- XSS protection
- Secure session management
- Environment-based secrets

#### Performance
- Asset precompilation
- Database indexing
- Efficient queries with includes/joins
- Counter caching for vote counts
- Optimized for free hosting tiers

---

## [Unreleased]

### Potential Future Features
- User accounts (optional)
- Poll analytics dashboard
- Email notifications
- Social media integration
- Poll templates
- Categories and tags
- Search functionality
- Poll comments
- Multi-language support
- Dark mode
- Export results as PDF/CSV
- API for external integrations
- Embed polls in websites
- Poll scheduling
- Anonymous vs. identified voting
- Poll editing after creation

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to contribute to this project.

---

## Versioning

We use [SemVer](http://semver.org/) for versioning. For available versions, see the [tags on this repository](https://github.com/yourusername/pola/tags).
