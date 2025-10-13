# Contributing to Pola

Thank you for your interest in contributing to Pola! This document provides guidelines and instructions for contributing.

## 🚀 Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/pola.git`
3. Create a new branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test your changes thoroughly
6. Commit with clear messages: `git commit -m "Add feature X"`
7. Push to your fork: `git push origin feature/your-feature-name`
8. Open a Pull Request

## 💡 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues. When creating a bug report, include:

- **Clear title and description**
- **Steps to reproduce**
- **Expected vs actual behavior**
- **Screenshots** (if applicable)
- **Environment details** (OS, Ruby version, Rails version)

### Suggesting Features

Feature suggestions are welcome! Please:

- **Check existing feature requests** first
- **Clearly describe the feature** and its benefits
- **Provide examples** of how it would work
- **Consider implementation complexity**

### Pull Requests

- Follow the existing code style
- Write clear commit messages
- Include tests for new features
- Update documentation as needed
- Keep PRs focused on a single feature/fix

## 🎨 Code Style

- Follow Ruby style guide
- Use 2 spaces for indentation
- Write descriptive variable names
- Add comments for complex logic
- Keep methods small and focused

## 🧪 Testing

Before submitting a PR:

1. Run the test suite (when available)
2. Test the feature manually
3. Ensure no existing features break
4. Test on different screen sizes (mobile, tablet, desktop)

## 📝 Commit Messages

- Use present tense ("Add feature" not "Added feature")
- Keep first line under 50 characters
- Be descriptive but concise
- Reference issue numbers when applicable

Examples:
```
Add QR code download button
Fix vote duplication bug #42
Update README with deployment steps
```

## 🌟 Feature Ideas

Some ideas for contributions:

- **Poll analytics dashboard**
- **Email notifications for poll creators**
- **Poll templates**
- **Social media sharing improvements**
- **Dark mode**
- **Multiple choice polls**
- **Poll categories/tags**
- **User accounts (optional)**
- **API for poll creation**
- **Embed polls in websites**

## 📦 Project Structure

Key files and directories:

- `app/controllers/polls_controller.rb` - Main controller logic
- `app/models/` - Database models (Poll, Option, Vote)
- `app/views/polls/` - View templates
- `config/routes.rb` - Application routes
- `db/migrate/` - Database migrations

## 🤝 Community

- Be respectful and inclusive
- Help others when possible
- Give constructive feedback
- Celebrate contributions

## ❓ Questions?

Feel free to open an issue for questions or reach out to the maintainers.

Thank you for contributing to Pola! 🎉
