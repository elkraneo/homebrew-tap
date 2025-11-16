# elkraneo's Homebrew Tap

## Usage

```bash
brew tap elkraneo/tap
brew install sbsift
```

## Available Formulae

- **sbsift**: Context-efficient Swift build analysis tool for Claude agents

## sbsift

`sbsift` is the third tool in the specialized sift family, completing the context efficiency trinity for Swift development. It converts verbose Swift build output into structured, minimal-context JSON.

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

### Features

- **Pipe-based interface** for seamless integration
- **Multi-command support**: build, test, run, package commands
- **Structured JSON output** for programmatic analysis
- **Context-optimized output** < 1KB for any build size
- **Error-aware** with detailed file/line/column information
- **Performance-focused** < 50ms parse time

For more information, visit: https://github.com/elkraneo/sbsift