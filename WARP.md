# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Quickstart

1. This is a **static site** (HTML/CSS/JS) for Soluto Consulting, hosted on **Cloudflare Pages**
2. No build step required - edit files directly in the root directory
3. Preview locally: `npx wrangler pages dev .` (after installing wrangler)
4. Deploy: Push to main branch triggers automatic Cloudflare Pages deployment
5. Domain: www.solutoconsulting.com (custom domain via Cloudflare Pages)
6. Demo site: External repo at https://spend-analysis-demo.pages.dev

## Architecture

### Static-First Design
- **Hosting**: Cloudflare Pages (free tier) with global CDN
- **No build process**: Direct HTML/CSS/JS files served from repository root
- **Client-side interactivity**: Vanilla JavaScript with external CDN resources (Pico CSS, ECharts for external demos)
- **Performance**: Sub-2-second global load times via Cloudflare's anycast network

### Project Structure
```
soluto-site/
├── index.html              # Main landing page (complete standalone file)
├── index-original.html     # Backup/reference version
├── content/                # Markdown content (Phase 2 - not yet active)
│   ├── services/          # Service descriptions with YAML frontmatter
│   ├── case-studies/      # Client success stories
│   └── projects/          # Project documentation
├── robots.txt             # SEO crawling directives
├── sitemap.xml           # Static sitemap (manually maintained)
├── wrangler.toml         # Cloudflare Pages configuration
├── verify-domain.sh      # Domain setup verification script
└── .wrangler/           # Local wrangler cache (gitignored)
```

## Common Commands

### Prerequisites
- Node.js 18+ (for wrangler CLI)
- Cloudflare account access for deployment

### Development
```bash
# Install Cloudflare Pages CLI globally
npm install -g wrangler

# Local development server
npx wrangler pages dev .

# Alternative: Simple HTTP server
python3 -m http.server 8000
# or
npx serve .
```

### Testing & Verification
```bash
# Verify domain configuration
./verify-domain.sh

# Test site locally
open http://localhost:8000

# Check wrangler configuration
npx wrangler pages project list
```

### Deployment
- **Automatic**: Push to `main` branch triggers Cloudflare Pages build
- **Manual**: `npx wrangler pages publish . --project-name soluto-site`

## Business Context

### Purpose
Professional consulting website for **Soluto Consulting** showcasing:
- Data Analytics expertise
- Business Intelligence services  
- Supply Chain Management optimization

### Target Personas
- Chief Procurement Officers
- CFOs and Finance Directors
- Operations VPs
- Supply Chain Managers

### Key Messaging
- **Value Proposition**: 8-25% cost savings within 6 months through data-driven procurement transformation
- **Differentiation**: Interactive demos showing real consulting methodology (5 Core Theses Framework)
- **Proof Points**: Quantified outcomes from client engagements

## Content Management

### Current Phase 1: Static HTML
- Single `index.html` file contains complete site
- Inline CSS for zero external dependencies (except CDN resources)
- Direct editing of HTML for content updates
- Manual sitemap.xml maintenance

### Phase 2 Roadmap: Automated Content
- Markdown-driven content in `content/` directory
- Static site generator integration (likely Eleventy)
- Automated sitemap.xml generation
- Git-based CMS workflow with Obsidian integration

### Content Structure
```
content/services/spend-analysis-consulting.md
├── YAML frontmatter: title, service_name, audience, outcomes
├── Methodology sections: 5 Core Theses Framework
└── Engagement model and ROI framework

content/case-studies/manufacturing-spend-optimization.md
├── YAML frontmatter: client, industry, results, metrics
└── Challenge/solution/outcome narrative

content/projects/interactive-spend-analysis-demo.md
├── Technical architecture documentation
├── Demo repository links
└── Business impact metrics
```

## Key Files & Configuration

### Critical Files
- `index.html`: Complete site implementation
- `wrangler.toml`: Cloudflare Pages routing and domain configuration
- `robots.txt`: SEO crawling permissions
- `sitemap.xml`: Manual sitemap (includes main site + external demo links)

### External Dependencies
- **Demo Platform**: https://spend-analysis-demo.pages.dev (separate repository)
- **CSS Framework**: Pico CSS via jsDelivr CDN
- **Analytics**: Cloudflare Web Analytics (commented out in HTML)

### Domain Configuration
```toml
# wrangler.toml
name = "soluto-site"
account_id = "40f316de02cef7268076b14d80b373ba"

[env.production.route]
pattern = "www.solutoconsulting.com/*"
zone_name = "solutoconsulting.com"

[env.production.route]  
pattern = "solutoconsulting.com/*"
zone_name = "solutoconsulting.com"
```

## SEO & Performance

### Current Optimization
- Semantic HTML structure with proper headings
- Meta descriptions and Open Graph tags
- Mobile-responsive design (viewport meta tag)
- Emoji favicon via data URI
- Fast loading via CDN delivery

### Performance Targets (from README)
- Load Time: < 2 seconds globally ✅
- Lighthouse Performance: 90+ ✅
- Accessibility: WCAG AA compliant ✅

### SEO Configuration
- Primary domain: www.solutoconsulting.com
- Canonical URL structure established
- Robots.txt allows all crawling
- Sitemap includes main pages + external demo links

## Deployment Workflow

### Cloudflare Pages Setup
1. **Repository Connection**: Connected to Git for automatic deployments
2. **Build Configuration**:
   - Build command: None (static files)
   - Output directory: Root (`.`)
   - Node version: 18+
3. **Domain Configuration**: Custom domain configured via Cloudflare Pages dashboard

### DNS Configuration
- Domain managed through Cloudflare DNS
- Automatic SSL/TLS with Always Use HTTPS enabled
- Both apex and www subdomain routing configured

### Rollback Process
Use Cloudflare Pages dashboard to:
1. Navigate to deployments
2. Select previous successful deployment
3. Promote to production

## Cost & Provider Policy

### Hosting Strategy
- **Primary**: Cloudflare Pages free tier (unlimited bandwidth, 500 builds/month)
- **CDN**: Included Cloudflare global edge network (no additional cost)
- **DNS**: Cloudflare DNS (free tier)
- **SSL**: Automatic via Cloudflare (free)

### Cost Optimization Guidelines
- Maintain static-first architecture to stay within free tiers
- Avoid Cloudflare paid features (Workers, R2, KV) unless specifically justified
- Leverage Cloudflare's anycast routing (no additional multi-provider setup needed)
- Use external CDNs (jsDelivr) for third-party libraries to minimize bandwidth usage

## Interactive Demos

### External Demo Architecture
- **Repository**: https://github.com/achosoluto/spend-analysis-demo
- **Deployment**: https://spend-analysis-demo.pages.dev (separate Cloudflare Pages project)
- **Integration**: Linked from main site via CTAs and demo sections

### Demo Content
Showcases "5 Core Theses Framework" for spend analysis consulting:
1. Data Clarity Unlocks Value
2. Consolidation Creates Leverage  
3. Compliance Stops Value Leakage
4. Price Variance Engineered Down
5. Working Capital as Strategic Lever

## Development Guidelines

### Editing Content
1. **Direct HTML editing** for immediate changes
2. Preserve responsive design classes and structure
3. Maintain accessibility attributes (alt text, semantic tags)
4. Test locally before pushing to main

### Adding New Sections
1. Follow existing HTML structure and CSS classes
2. Maintain consistent styling with CSS custom properties
3. Add appropriate CTAs with email pre-population
4. Update sitemap.xml if adding new routes

### Contact Form Integration
- Current implementation uses `mailto:` links with pre-populated subjects
- Email routing configured via Cloudflare Email Routing (free tier)
- Future: Cloudflare Forms integration for enhanced capture (within free tier)

## Troubleshooting

### Common Issues
- **Local development**: Use `npx wrangler pages dev .` for Cloudflare Pages simulation
- **DNS propagation**: Allow 5-10 minutes for changes (check with `./verify-domain.sh`)
- **HTTPS redirect**: Configured via Cloudflare dashboard settings
- **Mobile display**: Test responsive breakpoints at 320px, 768px, 1440px+

### Debug Commands
```bash
# Check DNS resolution
dig www.solutoconsulting.com

# Test HTTP/HTTPS redirects
curl -I http://www.solutoconsulting.com
curl -I https://www.solutoconsulting.com

# Verify SSL certificate
openssl s_client -connect www.solutoconsulting.com:443 -servername www.solutoconsulting.com
```

## Phase 2 Migration Notes

When transitioning to automated content management:
1. **SSG Selection**: Consider Eleventy for minimal complexity
2. **Content Migration**: Move inline content to markdown files in `content/`
3. **Template Creation**: Extract layout patterns from current `index.html`
4. **Build Process**: Add npm scripts while maintaining zero-cost deployment
5. **Backward Compatibility**: Preserve existing URLs and performance characteristics

---

*This site prioritizes performance, cost efficiency, and conversion optimization for enterprise consulting prospects. All changes should align with the strategic goal of demonstrating Soluto Consulting's data-driven methodology and quantified value proposition.*