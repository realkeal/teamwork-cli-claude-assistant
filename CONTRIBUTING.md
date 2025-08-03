# Contributing to Teamwork CLI

Thank you for your interest in contributing to Teamwork CLI! This document provides guidelines for contributing to the project.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/yourusername/teamwork-cli.git
   cd teamwork-cli
   ```
3. **Set up your development environment**:
   ```bash
   cp .env.example .env
   # Edit .env with your test Teamwork credentials
   ```

## Development Guidelines

### Code Style

- Follow existing bash scripting conventions
- Use meaningful function and variable names
- Add comments for complex logic
- Keep functions focused and single-purpose
- Use consistent indentation (2 spaces)

### Testing

Before submitting changes:

1. **Test basic functionality**:
   ```bash
   ./tw tasks --noai  # Test without AI
   ./tw open 123456   # Test task opening
   ./tw flags         # Test help output
   ```

2. **Test with different filters**:
   ```bash
   ./tw tasks --priority=high
   ./tw tasks --due=today
   ./tw tasks --tags="urgent"
   ```

3. **Test error scenarios**:
   - Invalid task IDs
   - Network connectivity issues
   - Missing environment variables

### Submitting Changes

1. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the guidelines above

3. **Test thoroughly** using the testing guidelines

4. **Commit with descriptive messages**:
   ```bash
   git commit -m "Add filter by task status functionality"
   ```

5. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request** on GitHub

## Pull Request Guidelines

### Description
- Clearly describe what the PR does
- Include motivation and context
- List any breaking changes
- Reference any related issues

### Testing
- Include testing steps in the PR description
- Ensure all existing functionality still works
- Test edge cases and error scenarios

### Documentation
- Update README.md if adding new features
- Update CLAUDE.md for internal documentation
- Add inline comments for complex logic

## Types of Contributions

### Bug Fixes
- Fix existing functionality that isn't working correctly
- Improve error handling and user feedback
- Performance optimizations

### New Features
- Additional filtering options
- New output formats
- Enhanced AI integration
- Task creation/editing capabilities

### Documentation
- Improve README examples
- Add troubleshooting guides
- Better API documentation

### Code Quality
- Refactor for better maintainability
- Add error handling
- Improve caching efficiency

## Issue Reporting

When reporting bugs:

1. **Use a clear title** describing the issue
2. **Provide steps to reproduce** the problem
3. **Include system information**:
   - Operating system
   - Bash version
   - Tool dependencies (curl, jq, claude versions)
4. **Include relevant logs** or error messages
5. **Describe expected vs actual behavior**

## Security

- Never commit credentials or sensitive data
- Use environment variables for all configuration
- Follow secure coding practices
- Report security vulnerabilities privately

## Questions?

- Open an issue for general questions
- Check existing issues before creating new ones
- Be respectful and constructive in discussions

Thank you for contributing to make Teamwork CLI better for everyone!