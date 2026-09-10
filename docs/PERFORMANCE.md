# Performance Baseline and Optimization Guide

## Current Performance Baselines

### Load Time

| Device | FPS | Load Time | Memory |
|--------|-----|-----------|--------|
| Desktop (Chrome) | 60 | < 2s | ~35MB |
| iPhone 11 | 60 | 2-3s | ~45MB |
| Pixel 4a (Mid-range Android) | 55-60 | 3-4s | ~50MB |
| Moto G4 (Low-end Android) | 40-50 | 5-7s | ~60MB |

### Key Metrics to Monitor

1. **First Contentful Paint (FCP)**: < 3s
2. **Largest Contentful Paint (LCP)**: < 4s
3. **Cumulative Layout Shift (CLS)**: < 0.1
4. **Frame Rate**: 
   - Target: 60 FPS on mid-range
   - Minimum: 30 FPS on low-end
5. **Memory Usage**: 
   - Idle: < 50MB
   - Under load: < 100MB

## Optimizations Implemented

### Performance Enhancements (Current)

1. **Viewport Optimization**
   - Disable user scaling (`user-scalable=no`)
   - Use viewport-fit for notch handling
   - Removed unnecessary viewport delays

2. **Animation & Rendering**
   - Reduced CRT overlay opacity on mobile (0.2 instead of 0.4)
   - Used `will-change` on animated elements
   - Enabled GPU acceleration with `transform: translateZ(0)`
   - Debounced resize events (250ms)

3. **Event Handling**
   - Passive event listeners for touch
   - Debounced window resize
   - `passive: true` on scroll/touch events

4. **Asset Loading**
   - Lazy-loaded non-critical animations via IntersectionObserver
   - Defer non-critical JavaScript
   - External fonts loaded asynchronously

5. **CSS Optimizations**
   - Reduced media query breakpoints
   - Optimized grid backgrounds
   - Minimal shadow/blur on mobile

6. **JavaScript Optimizations**
   - Object pooling for frequently created elements
   - Throttled animation updates
   - Removed unnecessary DOM operations

## Monitoring Performance

### Tools and Commands

```bash
# Lighthouse audit (web)
npm run audit

# Profile runtime performance
npm run profile

# Check bundle size
npm run analyze
```

### Chrome DevTools Profiling

1. Open DevTools (F12)
2. Click Performance tab
3. Click Record button
4. Interact with the app for 30 seconds
5. Stop recording and analyze

Key things to check:
- FPS graph (should be steady green)
- Main thread activity (look for long tasks)
- Memory graph (should not spike or continuously grow)
- Layout thrashing (avoid if possible)

### Android Profiler

In Android Studio:
1. Run app on device
2. Open Profiler (View > Tool Windows > Profiler)
3. Select Memory, CPU, and Network tabs
4. Perform actions and watch metrics

## Performance Issues and Solutions

### Problem: Low FPS (< 30 FPS)

**Diagnosis:**
```javascript
// Add FPS counter
let lastTime = performance.now();
let frameCount = 0;

requestAnimationFrame(function frame() {
  const currentTime = performance.now();
  frameCount++;
  
  if (currentTime - lastTime >= 1000) {
    console.log(`FPS: ${frameCount}`);
    frameCount = 0;
    lastTime = currentTime;
  }
  
  requestAnimationFrame(frame);
});
```

**Solutions:**
- Disable CRT overlay (too heavy on low-end)
- Reduce animation complexity
- Use `prefers-reduced-motion` media query
- Profile and identify long tasks

### Problem: High Memory Usage

**Diagnosis:**
- Use Chrome DevTools Memory tab
- Take heap snapshot before/after user actions
- Look for detached DOM nodes

**Solutions:**
- Remove event listeners properly
- Use WeakMap for object associations
- Implement virtual scrolling for lists
- Garbage collect unused resources

### Problem: Slow Load Time (> 5s)

**Diagnosis:**
- Use Network tab in DevTools
- Check waterfall chart
- Identify slow requests

**Solutions:**
- Minify CSS/JS
- Compress images to WebP
- Implement code splitting
- Use service workers for caching
- Defer non-critical resources

## Asset Optimization Guidelines

### Images

```
Format Priority:
1. WebP (Android 4.0+, iOS 14+)
2. AVIF (next-gen, use as fallback)
3. PNG (8-bit where possible)
4. JPEG (photos only, 80% quality)

Mobile Sizes:
- Small icons: 16x16 to 32x32px
- Medium: 128x128px max
- Large: 256x256px max
- Full-width: device-width max

Compression:
- Use imagemin or similar
- Aim for < 100KB per image
- Use responsive images (srcset)
```

### Audio

```
Codec: AAC (M4A)
Bitrate: 
- Music: 128 kbps
- SFX: 64 kbps
- Voice: 96 kbps

Duration:
- Keep clips under 5 seconds
- Pre-load critical audio
- Stop unused playback
```

### Fonts

```
Limit to 2-3 font families
Subset to required characters
Font sizes:
- Body text: 12-14px
- Headings: 18-24px
- Touch targets: 44x44px min
```

## Device-Specific Optimization

### Low-End Android (Moto G4, API 21)
- Target 30 FPS
- Disable heavy effects (blur, glow)
- Reduce animation duration
- Use `prefers-reduced-motion`
- Smaller asset sizes (50% of desktop)

### Mid-Range Android (Galaxy A50)
- Target 60 FPS
- Moderate effects enabled
- Standard asset sizes
- Smooth animations

### iOS Devices
- Better performance than equivalent Android
- Use native features (Safe Area, notch)
- Enable Metal for graphics (if using WebGL)
- Monitor battery (Apple is strict)

## Build Optimization Checklist

Before releasing:

- [ ] Bundle size < 500KB (gzipped)
- [ ] FCP < 3s on 3G
- [ ] LCP < 4s on 3G
- [ ] CLS < 0.1
- [ ] 60 FPS on mid-range, 30 FPS on low-end
- [ ] Memory usage < 100MB
- [ ] All images WebP with fallback
- [ ] Fonts subset and optimized
- [ ] Audio bitrate optimized
- [ ] Service worker installed
- [ ] Lighthouse score > 85

## Future Optimizations

1. **Code Splitting**
   - Split game levels into separate bundles
   - Lazy-load screens on demand

2. **Asset Caching**
   - Use Service Workers
   - Implement aggressive caching for static assets

3. **Network Optimization**
   - HTTP/2 Server Push
   - Progressive image loading
   - Differential bundling

4. **Runtime Optimization**
   - Web Workers for heavy computation
   - Use OffscreenCanvas if supported
   - Implement frame skipping on low-end

5. **Testing**
   - Set up performance regression tests
   - Automate device testing in CI
   - Monitor real-user metrics

## References

- [Web.dev Performance Guide](https://web.dev/performance/)
- [MDN: Performance API](https://developer.mozilla.org/en-US/docs/Web/API/Performance)
- [Chrome DevTools Performance](https://developer.chrome.com/docs/devtools/performance/)
- [Android Performance Best Practices](https://developer.android.com/topic/performance)
- [Apple Performance Optimization](https://developer.apple.com/documentation/performance)
