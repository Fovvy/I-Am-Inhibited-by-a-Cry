# 🚀 Deploy Pola to Render.com (100% Free)

## ✅ Your Database is Ready!

**Local Setup (Complete):**
- ✅ SQLite3 database created
- ✅ All migrations run successfully
- ✅ Sample data seeded
- ✅ Production config set for PostgreSQL

---

## 📦 Step-by-Step Render.com Deployment

### **Step 1: Push Your Code to GitHub**

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Pola poll app with vintage design"

# Create a new repo on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/pola.git
git push -u origin main
```

---

### **Step 2: Create Render.com Account**

1. Go to **https://render.com**
2. Click **"Get Started"** 
3. Sign up with your **GitHub account** (easiest way)

---

### **Step 3: Create PostgreSQL Database**

1. From Render Dashboard, click **"New +"** → **"PostgreSQL"**
2. Fill in:
   - **Name:** `pola-db` (or any name you want)
   - **Database:** `pola_production`
   - **User:** `pola`
   - **Region:** Choose closest to your users
   - **Plan:** Select **"Free"** (0$ forever!)
3. Click **"Create Database"**
4. Wait 1-2 minutes for it to provision
5. **IMPORTANT:** Copy the **"Internal Database URL"** (you'll need this!)

---

### **Step 4: Create Web Service**

1. Click **"New +"** → **"Web Service"**
2. Connect your GitHub account (if not already)
3. Select your **Pola repository**
4. Fill in the details:

   **Basic Info:**
   - **Name:** `pola` (this will be your URL: pola.onrender.com)
   - **Region:** Same as your database
   - **Branch:** `main`
   - **Root Directory:** Leave blank
   - **Runtime:** `Ruby`

   **Build & Deploy:**
   - **Build Command:** 
     ```bash
     bundle install && rails db:migrate && rails assets:precompile
     ```
   
   - **Start Command:**
     ```bash
     bundle exec rails server -b 0.0.0.0 -p $PORT
     ```

5. Scroll down to **"Advanced"** and click it

---

### **Step 5: Set Environment Variables**

Click **"Add Environment Variable"** for each:

| Key | Value | Notes |
|-----|-------|-------|
| `DATABASE_URL` | *Your Internal Database URL from Step 3* | Copy from PostgreSQL dashboard |
| `RAILS_ENV` | `production` | Tells Rails this is production |
| `RAILS_MASTER_KEY` | *See below* | Your secret master key |
| `RAILS_LOG_TO_STDOUT` | `true` | Enables logging |
| `RAILS_SERVE_STATIC_FILES` | `true` | Serves CSS/JS files |

**To get your RAILS_MASTER_KEY:**

```bash
# In your project folder, run:
cat config/master.key
```

If the file doesn't exist:
```bash
# Generate it:
rails credentials:edit
# Then copy the key from config/master.key
```

---

### **Step 6: Deploy!**

1. Scroll to bottom and click **"Create Web Service"**
2. Render will:
   - Clone your repo ✅
   - Install gems ✅
   - Run migrations ✅
   - Precompile assets ✅
   - Start your app ✅

3. Watch the build logs (takes 3-5 minutes first time)
4. When you see **"Your service is live 🎉"**, click the URL!

---

## 🎨 Post-Deployment Steps

### **Add Sample Data (Optional)**

```bash
# Option 1: From Render Dashboard
# Click your web service → Shell tab → Run:
rails db:seed

# Option 2: From your computer
# Install Render CLI: https://render.com/docs/cli
render shell pola
rails db:seed
```

### **Test Your App**

Visit your live URL (e.g., `https://pola.onrender.com`):

- ✅ Homepage loads with beautiful design
- ✅ Create a test poll
- ✅ Vote on a poll
- ✅ View results with charts
- ✅ Share links work
- ✅ QR codes generate

---

## 🔧 Troubleshooting

### **Database Connection Error**

```bash
# Make sure DATABASE_URL is correct
# Go to your PostgreSQL dashboard → Connection Details
# Copy "Internal Database URL" (NOT External)
```

### **Assets Not Loading (CSS/JS missing)**

```bash
# Add these environment variables:
RAILS_SERVE_STATIC_FILES=true
RAILS_LOG_TO_STDOUT=true

# Then trigger a redeploy:
# Go to your web service → Manual Deploy → Deploy latest commit
```

### **Migration Errors**

```bash
# SSH into your app:
render shell pola

# Check migration status:
rails db:migrate:status

# Run migrations manually if needed:
rails db:migrate
```

### **App Crashes on Boot**

Check the logs:
1. Go to your web service
2. Click "Logs" tab
3. Look for error messages (usually missing gems or env variables)

---

## 📝 Important Notes

### **Free Tier Limitations:**

- ⏰ App "spins down" after 15 minutes of inactivity
- 🔄 First request after sleep takes ~30 seconds to wake up
- 💾 Database: 1 GB storage (plenty for polls!)
- 🌐 750 hours/month of uptime (enough for 24/7!)

### **Custom Domain (Optional):**

1. Buy a domain (e.g., from Namecheap)
2. In Render dashboard → Settings → Custom Domains
3. Add your domain and follow DNS instructions

### **Database Backups:**

Render Free tier doesn't include automatic backups, but you can:

```bash
# Manual backup:
render shell pola
pg_dump $DATABASE_URL > backup.sql

# Or use a tool like pgbackups
```

---

## 🎯 Quick Reference Commands

```bash
# View logs
render logs -s pola

# SSH into app
render shell pola

# Run Rails console
render shell pola
rails console

# Run migrations
render shell pola
rails db:migrate

# Check database status
render shell pola
rails db:migrate:status

# Seed database
render shell pola
rails db:seed
```

---

## 🚀 Your App URLs

After deployment, you'll have:

- **Web App:** `https://pola.onrender.com` (or your custom name)
- **Database:** Internal URL (for your app only)
- **Render Dashboard:** `https://dashboard.render.com`

---

## ✨ That's It!

Your Pola poll app is now:
- ✅ **Live on the internet**
- ✅ **Using PostgreSQL** (production-ready)
- ✅ **100% Free** (no credit card needed!)
- ✅ **Auto-deploys** when you push to GitHub
- ✅ **HTTPS enabled** (secure by default)

Share your beautiful poll creator with the world! 🎉

---

## 🆘 Need Help?

- **Render Docs:** https://render.com/docs
- **Rails Guides:** https://guides.rubyonrails.org/
- **Render Community:** https://community.render.com/
- **Check logs first!** Most issues are in the logs

---

**Made with ❤️ · Deploy with 🚀 · Share with 🌍**
