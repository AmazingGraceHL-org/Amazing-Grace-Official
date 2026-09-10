# Mobile Development Guide for Amazing Grace OS

## Overview

This guide provides instructions for building, testing, and optimizing the Amazing Grace OS application for mobile devices (iOS and Android).

## Device Compatibility Matrix

### Minimum Supported Versions
- **iOS**: 13.0 and above
- **Android**: API Level 21 (Android 5.0) and above

### Target Devices for Testing

#### Low-End Android Devices (Performance Baseline)
- Samsung Galaxy A10 (2019)
- Motorola Moto G4
- Xiaomi Redmi 6A

#### Mid-Range Android Devices
- Samsung Galaxy A50
- Motorola Moto G7
- Xiaomi Redmi Note 8

#### iOS Devices
- iPhone SE (1st/2nd Gen)
- iPhone 8
- iPhone 11

## Build Instructions

### Prerequisites

- **Node.js**: 24.x or higher
- **npm**: 10.x or higher
- **For iOS builds**: Xcode 13.0+ and MacOS
- **For Android builds**: Android Studio, Android SDK 21+, and Java 8+

### Installing Dependencies

```bash
npm ci --no-audit --no-fund
```

### Web Build (Development)

```bash
npm run build
```

Output is generated in the `dist/` directory.

### Local Testing

```bash
# Start a local web server
npm run serve
# Open http://localhost:8000 in your browser
```

### Mobile Web Build

For mobile-optimized web builds:

```bash
npm run build:mobile
```

This creates a mobile-optimized bundle with:
- Reduced CRT overlay effects
- Touch-friendly UI targets (minimum 44x44px)
- Optimized animations for lower-end devices
- Compressed assets

### Android Build

```bash
# Build APK for testing
./build-scripts/build-android.sh

# Build signed APK for release
./build-scripts/build-android.sh --release
```

### iOS Build

```bash
# Build for iOS
./build-scripts/build-ios.sh

# Build for App Store submission
./build-scripts/build-ios.sh --release
```

## Testing on Mobile Devices

### Physical Device Testing

#### Using Android Device Manager
```bash
# List connected devices
adb devices

# Install APK on device
adb install ./dist/app.apk

# View logs
adb logcat
```

#### Using Xcode (iOS)
1. Open the project in Xcode
2. Select your device from the device menu
3. Click "Run" to build and deploy

### Mobile Web Testing

1. Use Chrome DevTools Device Emulation:
   - Open DevTools (F12)
   - Click the device toggle (⌨️📱)
   - Select device preset (iPhone, Pixel 4, etc.)

2. Test on actual devices:
   - Scan QR code from build output
   - Or navigate to `http://<your-ip>:8000`

### Performance Testing

#### Profiling Performance

```bash
# Profile FPS and performance metrics
npm run profile
```

Check the performance baseline metrics in [PERFORMANCE.md](./PERFORMANCE.md).

#### Lighthouse Audit (Web)
```bash
npm run audit
```

#### Frame Rate Testing
- Use Chrome DevTools Performance tab
- Record 30-60 seconds of user interaction
- Target: 60 FPS on mid-range, 30 FPS on low-end devices

#### Memory Profiling
- Use Android Profiler (Android Studio)
- Use Xcode Instruments (iOS)
- Target: < 100MB on low-end devices

### Mobile QA Checklist

Before releasing to mobile:

- [ ] Loads completely within 5 seconds on 3G
- [ ] Touch targets are minimum 44x44 pixels
- [ ] All text is readable at arm's length (12pt minimum on mobile)
- [ ] No horizontal scrolling on portrait mode
- [ ] Landscape mode displays correctly without rotation lock
- [ ] Battery usage is acceptable (< 1% per minute idle)
- [ ] App doesn't crash on low memory (< 50MB available)
- [ ] Touch events respond within 100ms
- [ ] Maintains 30 FPS on low-end devices

## Performance Optimization Tips

### Code Optimizations
- Use lazy loading for non-critical UI components
- Debounce resize and scroll events
- Use `requestAnimationFrame` for animations
- Implement virtual scrolling for long lists
- Minimize DOM reflows and repaints

### Asset Optimization
- Images: Use WebP with PNG fallback
- Audio: Use AAC 64kbps for mobile
- Reduce CRT overlay opacity on mobile
- Cache static assets aggressively

### Runtime Optimization
- Disable heavy animations on low-power devices
- Use `will-change` CSS property strategically
- Implement object pooling for frequently created objects
- Throttle event handlers

## Responsive Design Breakpoints

- **Extra Small (XS)**: 320px - 479px (phones)
- **Small (SM)**: 480px - 639px (large phones)
- **Medium (MD)**: 640px - 1023px (tablets portrait)
- **Large (LG)**: 1024px+ (tablets landscape, desktop)

## Troubleshooting

### App Crashes on Startup
- Clear app cache
- Reinstall the app
- Check `adb logcat` or Xcode console for errors

### Poor Performance
- Profile using DevTools
- Check network waterfall (reduce assets)
- Disable animations (`prefers-reduced-motion`)
- Reduce viewport resolution

### Touch Not Responsive
- Check minimum touch target sizes (44x44px)
- Verify event listeners are not passive blocking
- Check CSS pointer-events property

### Network Issues
- Test on actual 3G/4G network (not WiFi)
- Implement timeout and retry logic
- Compress assets aggressively

## CI/CD Pipeline

Mobile builds are automatically tested in CI:

```yaml
- Build for web (all commits)
- Build for Android (all commits)
- Build for iOS (all commits)
- Run Lighthouse audit (PR reviews)
- Performance regression tests
```

View CI logs in `.github/workflows/`.

## Resources

- [MDN: Responsive Web Design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
- [Android Developer Guide](https://developer.android.com/guide)
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [Web Vitals](https://web.dev/vitals/)

## Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines on mobile-first development.

## License

See [LICENSE](../LICENSE) for details.
