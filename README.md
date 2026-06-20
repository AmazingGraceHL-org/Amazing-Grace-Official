# Amazing Grace OS - Nexus Arcade

A mysterious gateway application combining retro arcade aesthetics with modern mobile-first design.

## 🚀 Quick Start

### Prerequisites
- Node.js 24.x or higher
- npm 10.x or higher

### Installation

```bash
git clone https://github.com/AmazingGraceHL-org/Amazing-Grace-Official.git
cd Amazing-Grace-Official
npm ci --no-audit --no-fund
```

### Development

```bash
# Start local development server
npm run serve

# Open http://localhost:8000 in your browser
```

### Build

```bash
# Production web build
npm run build

# Mobile-optimized build
npm run build:mobile

# Android build
./build-scripts/build-android.sh

# iOS build
./build-scripts/build-ios.sh
```

## 📱 Mobile Development

This project is **mobile-first**. All development prioritizes:
- **Performance**: 60 FPS on mid-range, 30 FPS on low-end devices
- **UX**: Touch-friendly, responsive layouts (320px-1440px)
- **Accessibility**: Keyboard navigation, screen reader support

See [MOBILE-README.md](docs/MOBILE-README.md) for:
- Device compatibility matrix
- Building and testing on mobile devices
- Performance profiling instructions
- QA checklist

## 📊 Performance

See [PERFORMANCE.md](docs/PERFORMANCE.md) for:
- Current baseline metrics
- Performance optimization guidelines
- Tools and profiling instructions
- Asset optimization guide

## 🏗️ Repository Structure

```
Amazing-Grace-Official/
├── src/                           # Source code
│   ├── index.html                # Main application
│   ├── core/                     # Core game logic
│   └── platform/                 # Platform-specific code
├── assets/                        # Game assets
│   ├── mobile/                   # Mobile-optimized assets
│   ├── desktop/                  # Desktop-specific assets
│   └── atlases/                  # Sprite atlases
├── build-scripts/                # Build automation
│   ├── build-android.sh
│   └── build-ios.sh
├── docs/                         # Documentation
│   ├── MOBILE-README.md         # Mobile dev guide
│   ├── PERFORMANCE.md           # Performance guide
│   └── CONTRIBUTING.md          # Contributing guidelines
├── tests/                        # Test files
├── .github/
│   └── workflows/
│       └── mobile-ci.yml        # CI/CD pipeline
├── CONTRIBUTING.md              # Contribution guidelines
├── LICENSE                      # MIT License
└── package.json                 # Dependencies and scripts
```

## 🎮 Features

- **Retro Arcade Aesthetics**: 80s-inspired CRT scanlines and pixel fonts
- **Responsive Layout**: Adapts seamlessly from mobile to desktop
- **Touch Optimized**: 44x44px touch targets, swipe gestures
- **Performance First**: Lazy loading, debounced events, GPU acceleration
- **Accessible**: WCAG 2.1 AA compliant, keyboard navigation

## 🧪 Testing

```bash
# Run all tests
npm run test

# Run smoke tests
npm run test:smoke

# Lint code
npm run lint

# Performance audit
npm run audit

# Profile performance
npm run profile
```

## 🚀 CI/CD

GitHub Actions automatically:
- ✅ Lints code on every push
- ✅ Builds for web, Android, and iOS
- ✅ Runs smoke tests
- ✅ Checks bundle size
- ✅ Monitors performance regressions

View workflows in [.github/workflows/](/.github/workflows/)

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) for:
- Development setup
- Code style guidelines
- Mobile testing requirements
- Pull request process

### Key Guidelines
1. **Mobile-first design**: Always consider mobile constraints
2. **Touch targets**: Minimum 44x44 pixels
3. **Performance**: Test on low-end devices
4. **Responsive**: Works 320px-1440px
5. **Accessible**: Keyboard navigation, screen reader support

## 📦 Supported Platforms

- **Web**: Chrome, Firefox, Safari, Edge (latest 2 versions)
- **Android**: API Level 21+ (Android 5.0+)
- **iOS**: 13.0+

## 🎯 Performance Targets

- **First Contentful Paint**: < 3s on 3G
- **Frame Rate**: 60 FPS (mid-range), 30 FPS (low-end)
- **Memory**: < 100MB under load
- **Bundle Size**: < 500KB (gzipped)

## 📝 Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history.

## 📄 License

This project is licensed under the MIT License. See [LICENSE](./LICENSE) file for details.

## 🙏 Acknowledgments

Created by [NicholaiMM](https://github.com/nicholaimadias)

---

**Ready to develop?** Start with [CONTRIBUTING.md](./CONTRIBUTING.md) and [docs/MOBILE-README.md](docs/MOBILE-README.md).
