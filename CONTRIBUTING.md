# Contributing to Amazing Grace OS

Thank you for your interest in contributing to the Amazing Grace OS project! This guide provides information on how to report issues, suggest enhancements, and submit pull requests.

## Code of Conduct

Please be respectful and constructive in all interactions with other contributors.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR-USERNAME/Amazing-Grace-Official.git`
3. Create a branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test on multiple devices (see MOBILE-README.md)
6. Commit with clear messages: `git commit -m "Add feature: description"`
7. Push and create a Pull Request

## Development Setup

### Prerequisites

- Node.js 24.x or higher
- npm 10.x or higher

### Installation

```bash
# Clone the repository
git clone https://github.com/AmazingGraceHL-org/Amazing-Grace-Official.git
cd Amazing-Grace-Official

# Install dependencies
npm ci --no-audit --no-fund

# Start development server
npm run serve
```

## Development Workflow

### Mobile-First Development

All features must be:
1. **Designed for mobile first** (320px viewport minimum)
2. **Progressive enhancement** for larger screens
3. **Touch-friendly** (44x44px minimum touch targets)
4. **Performance-aware** (test on low-end devices)

### Code Style

- Use 2-space indentation
- Use semantic HTML
- Avoid inline styles (use Tailwind CSS classes)
- Keep functions under 50 lines
- Use meaningful variable names

### Mobile Testing Checklist

Before submitting a PR, test on:

- [ ] Chrome DevTools (iPhone 6, Pixel 2 emulation)
- [ ] At least one physical Android device
- [ ] At least one iOS device (if possible)
- [ ] Landscape and portrait orientations
- [ ] Slow 3G network speed

### Performance Requirements

- FCP: < 3 seconds on 3G
- Frame rate: 60 FPS on mid-range, 30 FPS on low-end
- Memory: < 100MB under load
- Bundle size: < 500KB (gzipped)

## Submitting Changes

### Pull Request Process

1. Update [CHANGELOG.md](../CHANGELOG.md) if applicable
2. Ensure tests pass: `npm run test`
3. Run linter: `npm run lint`
4. Add descriptive title and description to PR
5. Reference any related issues (#123)

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix (non-breaking change)
- [ ] New feature (non-breaking change)
- [ ] Breaking change
- [ ] Mobile optimization

## Testing
- [ ] Tested on Android low-end device
- [ ] Tested on Android mid-range device
- [ ] Tested on iOS device
- [ ] Performance metrics acceptable
- [ ] No console errors

## Mobile Compatibility
- [ ] Touch targets are 44x44px minimum
- [ ] Responsive layout (320px-1440px)
- [ ] Network throttling (3G) works
- [ ] Memory usage acceptable

## Related Issues
Closes #123
```

## Reporting Issues

### Bug Reports

Include the following:
- Device model and OS version
- Browser/app version
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots/videos if applicable
- Performance metrics if performance-related

### Feature Requests

Include:
- Detailed description of feature
- Use case and benefit
- Suggested implementation (optional)
- Mobile compatibility considerations

## Repository Structure

```
Amazing-Grace-Official/
├── src/
│   ├── index.html              # Main application
│   ├── core/                   # Core game logic
│   └── platform/               # Platform-specific code
├── assets/
│   ├── mobile/                 # Mobile-optimized assets
│   ├── desktop/                # Desktop assets
│   └── atlases/                # Sprite atlases
├── build-scripts/              # Build automation
├── docs/
│   ├── MOBILE-README.md        # Mobile dev guide
│   ├── PERFORMANCE.md          # Performance guide
│   └── CONTRIBUTING.md         # This file
├── tests/                      # Test files
├── .github/
│   └── workflows/              # CI/CD workflows
└── package.json                # Dependencies and scripts
```

## Build Commands

```bash
# Development
npm run serve              # Start local server

# Production
npm run build              # Build for web
npm run build:mobile       # Mobile-optimized build

# Mobile-specific
./build-scripts/build-android.sh        # Android APK
./build-scripts/build-ios.sh            # iOS app

# Quality checks
npm run lint               # Run linter
npm run test               # Run tests
npm run audit              # Lighthouse audit
npm run profile            # Performance profiling
```

## Performance Guidelines

### What to Avoid

- Large images without compression
- Heavy CSS filters/shadows on animations
- Polling (use events or RequestAnimationFrame)
- Synchronous operations in hot code paths
- Large DOM trees (use virtual scrolling)
- Blocking JavaScript (defer/async)

### What to Do

- Use CSS transforms for animations
- Implement lazy loading
- Use IntersectionObserver for visibility detection
- Debounce/throttle event handlers
- Minimize reflows/repaints
- Use Will-change CSS property strategically

### Asset Optimization

- Images: 
  - Use WebP format
  - Compress with imagemin
  - Responsive sizes (srcset)
  
- Audio:
  - AAC codec, optimized bitrate
  - Minimal duration
  
- Fonts:
  - Subset character sets
  - Limit to 2-3 families

## CI/CD Pipeline

All PRs undergo:
1. Linting checks
2. Build verification
3. Mobile build compilation
4. Performance regression tests
5. Code review

Ensure all checks pass before requesting review.

## Accessibility

- Use semantic HTML
- Provide alt text for images
- Ensure keyboard navigation
- Test with screen readers
- Maintain sufficient color contrast
- Support `prefers-reduced-motion`

## Documentation

- Update docs when changing functionality
- Include code examples
- Document mobile-specific considerations
- Add inline comments for complex logic
- Keep README.md current

## Questions?

- Open an issue for bugs
- Start a discussion for questions
- Check existing issues first

Thank you for contributing! 🙏
