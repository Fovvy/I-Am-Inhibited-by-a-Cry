# 🚀 Deployment Guide for Pola

This guide covers deploying Pola to various hosting platforms, all with **free tiers available**.

---

## 📋 Pre-Deployment Checklist

Before deploying, ensure:

- ✅ All code is committed and pushed to GitHub
- ✅ Database migrations are up to date
- ✅ Environment variables are documented
- ✅ Production settings are configured
- ✅ Assets are precompilable

---

## 1️⃣ Render.com (Recommended)

**Why Render?**
- 100% free tier with PostgreSQL
- Automatic deployments from GitHub
- Easy setup and configuration
- Good performance

### Step-by-Step Guide

1. **Create Account**
   - Go to [render.com](https://render.com)
   - Sign up with GitHub

2. **Create New Web Service**
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the Pola repository

3. **Configure Service**
   ```
   Name: pola (or your preferred name)
   Region: Choose closest to your users
   Branch: main
   Runtime: Ruby
   Build Command: ./bin/render-build.sh
   Start Command: bundle exec rails server -b 0.0.0.0 -p $PORT
   ```

4. **Add PostgreSQL Database**
   - Click "New +" → "PostgreSQL"
   - Name it `pola-db`
   - Choose free tier
   - Wait for it to provision

5. **Set Environment Variables**
   - In your web service settings, add:
   ```
   DATABASE_URL: (Copy from PostgreSQL dashboard)
   RAILS_ENV: production
   RAILS_LOG_TO_STDOUT: true
   RAILS_SERVE_STATIC_FILES: true
   SECRET_KEY_BASE: (Generate with: rails secret)
   ```

6. **Deploy**
   - Click "Create Web Service"
   - Wait for the build to complete (5-10 minutes)
   - Your app will be live at: `https://your-app-name.onrender.com`

### Auto-Deployment

Render automatically deploys when you push to your GitHub repository!

---

## 2️⃣ Railway.app

**Why Railway?**
- Very simple deployment
- $5 free credit per month
- PostgreSQL included
- Excellent developer experience

### Quick Deploy

```bash
# Install Railway CLI
npm install -g railway

# Login
railway login

# Initialize project
railway init

# Add PostgreSQL
railway add

# Deploy
railway up
```

### Environment Variables

Set these in the Railway dashboard:

```
RAILS_ENV=production
SECRET_KEY_BASE=<generate-with-rails-secret>
```

---

## 3️⃣ Fly.io

**Why Fly.io?**
- Free tier includes PostgreSQL
- Edge deployment (fast globally)
- Docker-based deployment

### Deploy Steps

```bash
# Install flyctl
curl -L https://fly.io/install.sh | sh

# Launch app
fly launch

# Set secrets
fly secrets set SECRET_KEY_BASE=$(rails secret)
fly secrets set RAILS_MASTER_KEY=$(cat config/master.key)

# Deploy
fly deploy
```

---

## 4️⃣ Heroku

**Why Heroku?**
- Classic PaaS, very stable
- Free tier available (with limitations)
- Large ecosystem

### Deploy Steps

```bash
# Login
heroku login

# Create app
heroku create pola-app

# Add PostgreSQL
heroku addons:create heroku-postgresql:mini

# Set buildpacks
heroku buildpacks:set heroku/ruby

# Deploy
git push heroku main

# Run migrations
heroku run rails db:migrate

# Seed database (optional)
heroku run rails db:seed
```

---

## 🔐 Security Configuration

### Generate SECRET_KEY_BASE

```bash
rails secret
```

Copy the output and use it as your `SECRET_KEY_BASE` environment variable.

### Master Key

If using encrypted credentials:

```bash
cat config/master.key
```

Set this as `RAILS_MASTER_KEY` environment variable.

---

## 🗃️ Database Setup

### Production Migration

After deployment, run:

```bash
# Render
render shell
rails db:migrate

# Railway
railway run rails db:migrate

# Fly.io
fly ssh console
rails db:migrate

# Heroku
heroku run rails db:migrate
```

### Seed Data (Optional)

```bash
rails db:seed
```

---

## 📊 Monitoring

### Check Logs

**Render:**
```bash
# View in dashboard or CLI
render logs
```

**Railway:**
```bash
railway logs
```

**Fly.io:**
```bash
fly logs
```

**Heroku:**
```bash
heroku logs --tail
```

---

## 🔧 Troubleshooting

### Common Issues

**1. Asset Compilation Fails**
```bash
# Run locally to test
RAILS_ENV=production rails assets:precompile
```

**2. Database Connection Issues**
- Verify `DATABASE_URL` is set correctly
- Check database is provisioned and running
- Ensure migrations have run

**3. Secret Key Missing**
```bash
# Generate new one
rails secret
```

**4. 500 Internal Server Error**
- Check logs for details
- Verify all environment variables are set
- Ensure migrations completed successfully

---

## 🎉 Post-Deployment

After successful deployment:

1. **Test the app** - Visit your live URL
2. **Create a test poll** - Ensure all features work
3. **Check QR codes** - Test QR code generation
4. **Test voting** - Try voting from different devices
5. **Monitor logs** - Watch for any errors

---

## 🔄 Updating Your App

### Push Updates

```bash
# Commit changes
git add .
git commit -m "Your update message"
git push origin main
```

Most platforms auto-deploy on push to main branch.

### Manual Deployment

**Render:** Automatically deploys on git push

**Railway:**
```bash
railway up
```

**Fly.io:**
```bash
fly deploy
```

**Heroku:**
```bash
git push heroku main
```

---

## 💰 Cost Comparison

| Platform | Free Tier | Database | Limits |
|----------|-----------|----------|--------|
| Render   | Yes       | PostgreSQL | 750 hours/month |
| Railway  | $5 credit | PostgreSQL | ~500 hours/month |
| Fly.io   | Yes       | PostgreSQL | 3 VMs, 3GB storage |
| Heroku   | Limited   | PostgreSQL | Sleeps after 30min |

---

## 📞 Need Help?

- Check the [README](README.md) for setup instructions
- Review [CONTRIBUTING](CONTRIBUTING.md) for development guidelines
- Open an issue on GitHub
- Check hosting platform documentation

---

**Happy Deploying! 🚀**
