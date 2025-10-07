#!/bin/bash

echo "🌐 Verifying Custom Domain Setup..."
echo "=================================="

# Test main domain
echo "Testing www.solutoconsulting.com..."
if curl -s -I https://www.solutoconsulting.com | grep -q "200 OK"; then
    echo "✅ Main site: WORKING"
else
    echo "❌ Main site: Not yet active (DNS propagation may take 5-10 minutes)"
fi

# Test demo subdomain  
echo "Testing spend.solutoconsulting.com..."
if curl -s -I https://spend.solutoconsulting.com | grep -q "200 OK"; then
    echo "✅ Demo site: WORKING"
else
    echo "❌ Demo site: Not yet active (DNS propagation may take 5-10 minutes)"
fi

# Test SSL
echo "Testing SSL certificates..."
if curl -s -I https://www.solutoconsulting.com | grep -q "cf-ray"; then
    echo "✅ Cloudflare SSL: ACTIVE"
else
    echo "⏳ SSL: Still propagating..."
fi

# Test redirect
echo "Testing HTTP to HTTPS redirect..."
if curl -s -I http://www.solutoconsulting.com | grep -q "301\|302"; then
    echo "✅ HTTPS redirect: WORKING"
else
    echo "⏳ HTTPS redirect: Still configuring..."
fi

echo ""
echo "🎉 Once all show ✅, your professional URLs are ready!"
echo "📧 Email signatures: www.solutoconsulting.com"
echo "🎯 Demo links: spend.solutoconsulting.com"