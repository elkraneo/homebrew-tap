# elkraneo's Homebrew Tap

## 🚀 Installation

```bash
brew tap elkraneo/tap
brew install sbsift
brew install spmsift
```

## 📦 Available Formulae

### **sbsift** - A+ Grade Swift Build Analysis Tool

**Transforms verbose Swift build output into structured, minimal-context JSON with 90%+ size reduction**

**Features:**
- 🗜️ **Massive Context Reduction**: 43% → 90%+ output size reduction
- ⚡ **Real-time Monitoring**: Progress tracking with hang detection
- 🔍 **Bottleneck Detection**: Identify slow compilation files
- 📈 **Performance Metrics**: File-level timing analysis
- 🔄 **Multiple Output Modes**: JSON, Compact, Minimal
- 🛡️ **Error Detection**: Structured error/warning extraction
- ⏱️ **Timeout Protection**: Prevent infinite builds

### Installation

```bash
brew tap elkraneo/tap
brew install sbsift
```

### Quick Start

```bash
# Basic build analysis
swift build | sbsift

# Compact output (60-70% reduction)
swift build | sbsift --compact

# Minimal output (85%+ reduction)
swift build | sbsift --minimal

# Performance analysis (top 5 slowest files)
swift build | sbsift --bottleneck 5

# Real-time monitoring (5-minute timeout)
swift build | sbsift --monitor 300
```

### Advanced Usage

```bash
# File-level timing analysis
swift build | sbsift --file-timing

# Error filtering (only errors and warnings)
swift build | sbsift --severity warning

# Development aliases
alias sb="swift build | sbsift --compact"
alias sbp="swift build | sbsift --bottleneck 5"
alias sbm="swift build | sbsift --monitor 600"
```

## spmsift

`spmsift` converts verbose Swift Package Manager output into structured, minimal-context JSON.

### Installation

```bash
brew tap elkraneo/tap
brew install spmsift
```

### Usage

```bash
# Analyze package structure
swift package dump-package | spmsift

# Analyze dependencies
swift package show-dependencies | spmsift --format summary

# Include metrics
swift package dump-package | spmsift --metrics
```

## The Sift Family

Together, sbsift and spmsift provide complete Swift ecosystem analysis:

- **spmsift** → Package structure and dependencies (~1.5KB output)
- **sbsift** → Build compilation and errors (~500B output)

For more information:
- sbsift: https://github.com/elkraneo/sbsift
- spmsift: https://github.com/elkraneo/spmsift
