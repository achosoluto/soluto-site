# SolutoConsulting.com

**For contributors and AI agents: see `WARP.md` for development and operational guidance.**

Professional website for Soluto Consulting - Data Analytics, Business Intelligence, and Supply Chain Management Optimization expertise.

## 🎯 Purpose

Showcase consulting expertise and attract potential customers through:
- Interactive demos and portfolio pieces
- Quantified case studies and outcomes
- Professional service offerings
- Thought leadership content

## 🏗️ Architecture

**Phase 1: Simple & Fast**
- Static site optimized for performance and SEO
- Cloudflare Pages hosting (free tier with global CDN)
- Automated deployment from GitHub

**Phase 2: Content Management System**
- Git-based CMS with Obsidian integration
- Automated content publishing workflow
- AI-powered content generation capabilities

## 📊 Key Showcases

### Interactive Demos
- **Spend Analysis Demo**: Live interactive visualization at `/demos/spend-analysis`
  - Repository: [achosoluto/spend-analysis-demo](https://github.com/achosoluto/spend-analysis-demo)
  - Demonstrates 5 core theses of spend analysis consulting

### Core Expertise Areas
1. **Data Analytics**: Spend analysis, vendor rationalization, compliance monitoring
2. **Business Intelligence**: Executive dashboards, KPI tracking, ROI measurement  
3. **Supply Chain Management**: Procurement optimization, strategic sourcing, risk management

## 🚀 Deployment

### Cloudflare Pages Configuration
- **Domain**: www.solutoconsulting.com
- **Build Command**: `npm run build` (or static files)
- **Output Directory**: `dist` or root for static
- **Node Version**: 18+

### DNS Configuration
- Domain managed through Cloudflare DNS
- Automatic SSL/TLS with Always Use HTTPS
- Global CDN and performance optimization

## 📈 Performance Targets

- **Load Time**: < 2 seconds globally
- **Lighthouse Performance**: 90+
- **Accessibility**: WCAG AA compliant
- **SEO**: Optimized for target personas (CPOs, CFOs, Operations Executives)

## 🎨 Brand & Messaging

### Target Audience
- **Primary**: Chief Procurement Officers, CFOs, Operations VPs
- **Secondary**: IT Leaders, Vendor Management Teams, Finance Directors

### Value Propositions
- **Immediate ROI**: 8-25% savings within 6 months
- **Risk Reduction**: Compliance, supplier, and operational risk mitigation
- **Strategic Transformation**: From cost center to value driver
- **Proven Methodology**: Quantified outcomes from real engagements

## 📁 Repository Structure

```
soluto-site/
├── src/                 # Source files (Phase 2)
├── content/            # Markdown content
│   ├── case-studies/   # Client success stories
│   ├── services/       # Service offerings
│   └── blog/          # Thought leadership
├── public/            # Static assets
├── scripts/           # Build and deployment scripts
└── docs/              # Documentation and runbooks
```

## 🔄 Development Workflow

### Phase 1: Manual Updates
1. Edit files directly in repository
2. Commit and push to trigger deployment
3. Cloudflare Pages automatically builds and deploys

### Phase 2: Automated Content Management
1. Content authored in Obsidian
2. Automated sync to repository via Git plugin
3. GitHub Actions process and validate content
4. Automatic deployment with preview builds

## 📞 Contact & Lead Capture

- **Contact Form**: Secured with Cloudflare Turnstile
- **Email Routing**: Cloudflare Email Routing (free tier)
- **Analytics**: Cloudflare Web Analytics (privacy-focused, free)
- **CRM Integration**: Lightweight logging to GitHub Issues or Google Sheets

---

**Status**: Phase 1 Setup ✅  
**Next**: Create initial landing page and deploy spend-analysis-demo

Built with a focus on lowest-cost hosting with automatic global routing and load balancing.