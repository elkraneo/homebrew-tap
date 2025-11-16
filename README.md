# elkraneo's Homebrew Tap

## Usage

```bash
brew tap elkraneo/tap
brew install sbsift
brew install spmsift
```

## Available Formulae

- **sbsift**: Context-efficient Swift build analysis tool for Claude agents
- **spmsift**: Context-efficient Swift Package Manager analysis tool for Claude agents

## sbsift

`sbsift` converts verbose Swift build output into structured, minimal-context JSON.

### Installation

```bash
brew tap elkraneo/tap
brew install sbsift
```

### Usage

```bash
# Analyze Swift build output
swift build --target MyTarget | sbsift

# Analyze test output
swift test | sbsift --format summary

# Include performance metrics
swift build | sbsift --metrics
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
