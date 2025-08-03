# Teamwork CLI

A comprehensive command-line interface for interacting with Teamwork.com project management system. Features task management, project selection, advanced filtering, and intelligent caching.

## Features

- **Interactive Project Selection** - Arrow key navigation through your assigned projects
- **Task Management** - List, filter, and view tasks with clean formatting
- **Advanced Filtering** - Filter by priority, due date, start date, and tags
- **Smart Caching** - Efficient caching with task-based invalidation
- **Clean Terminal Output** - Simple, structured formatting for easy reading

## Installation

### Prerequisites

Ensure you have the following installed:
- `bash`
- `curl` 
- `jq`
- `claude` (Claude Code CLI) - for AI features

Install Claude Code CLI:
```bash
npm install -g @anthropic-ai/claude-cli
claude auth login
```

### Install Teamwork CLI

1. **Clone this repository:**
   ```bash
   git clone https://github.com/realkeal/teamwork-cli-claude-assistant.git
   cd teamwork-cli-claude-assistant
   ```

2. **Run the installer:**
   ```bash
   ./install.sh
   ```

3. **Configure your credentials:**
   ```bash
   cp .env.example .env
   # Edit .env with your Teamwork credentials
   ```

## Configuration

Create a `.env` file with your Teamwork credentials:

```bash
# Your Teamwork domain URL
TEAMWORK_URL="https://yourcompany.teamwork.com"

# Your Teamwork API key (found in profile settings)
API_KEY="your_api_key_here"

# Your Teamwork password
PASSWORD="your_password_here"

# Your Teamwork user ID (found in profile URL)
USER_ID="123456"

# Optional: Comma-separated project IDs for fallback
PROJECT_IDS="12345,67890"
```

The tool looks for configuration in this order:
1. `.env` file in the script directory (local)
2. `~/.tw.env` file in your home directory (global)

## Usage

### Basic Commands

```bash
tw                    # Interactive project selection wizard
tw tasks              # List all tasks
tw tasks --summary    # List tasks with short AI summaries
tw summary 123456     # Get detailed AI summary for specific task
tw open 123456        # Get URL for task ID
tw open "Task Title"  # Get URL by searching task title
tw flags              # Show help and available options
```

### Filtering Options

```bash
tw tasks --priority=high           # Filter by priority
tw tasks --due=today              # Filter by due date
tw tasks --due=overdue            # Show overdue tasks
tw tasks --due=2024-12-25         # Filter by specific date
tw tasks --start=today            # Filter by start date
tw tasks --tags="urgent"          # Filter by tag name
```

### AI Features

AI summaries analyze the task title, description, and recent comments to provide user-focused insights:

```bash
tw tasks --summary              # Add short AI summaries to task list
tw tasks --summary=long         # Add detailed AI summaries to task list  
tw summary 123456               # Get detailed AI summary for specific task
tw summary "Task Title"         # Get AI summary by searching task title
```

### Cache Management

```bash
tw refresh                        # Clear all cached data
```

## Output Format

### Basic Task List

```
--- Complete user registration system ---
ID: 123456  |  Priority: HIGH  |  Due: Friday 8 Aug, 2025
Description: Implement user registration with email verification and secure password hashing using bcrypt
URL: https://company.teamwork.com/app/tasks/123456
Tags: backend, security

--- Fix login validation bug ---
ID: 123457  |  Priority: MEDIUM  |  Due: Monday 12 Aug, 2025
Description: Fix the validation issue in the login form that prevents users from signing in
URL: https://company.teamwork.com/app/tasks/123457
Tags: bug, frontend
```

### With AI Summaries

```
--- Complete user registration system ---
ID: 123456  |  Priority: HIGH  |  Due: Friday 8 Aug, 2025
Description: Implement user registration with email verification and secure password hashing
URL: https://company.teamwork.com/app/tasks/123456
Tags: backend, security
Summary: User registration form is complete, working on backend validation and password hashing implementation

--- Fix login validation bug ---
ID: 123457  |  Priority: MEDIUM  |  Due: Monday 12 Aug, 2025
Description: Fix the validation issue in the login form that prevents users from signing in
URL: https://company.teamwork.com/app/tasks/123457
Tags: bug, frontend
Summary: Bug reproduced and root cause identified in form validation logic, fix ready for testing
```

### Detailed AI Summary

```
--- Fix login validation bug ---
ID: 123457  |  Priority: MEDIUM  |  Due: Monday 12 Aug, 2025

SUMMARY: Bug has been reproduced and root cause identified in the form validation logic. Initial fix has been implemented but needs testing before deployment.

NEXT STEPS:
- Test fix with various input scenarios
- Review code changes with senior developer
- Deploy to staging environment for QA testing
- Update documentation with new validation rules
```

## API Endpoints

The tool uses these Teamwork API endpoints:

- `GET /projects/api/v3/projects.json` - Fetch assigned projects
- `GET /projects/api/v3/tasks.json` - Fetch tasks across projects
- `GET /projects/api/v3/projects/{id}/tasks.json` - Fetch project-specific tasks
- `GET /projects/api/v3/tasks/{id}.json` - Get task details
- `GET /projects/api/v3/tasks/{id}/comments.json` - Get task comments
- `GET /projects/api/v3/tags.json` - Fetch available tags

## Caching

The tool implements intelligent caching:

- **Task-based validation** - Cache remains valid until tasks are updated
- **Cross-project persistence** - Cache maintained when switching projects
- **Automatic invalidation** - Refreshes when tasks are modified
- **Manual refresh** - Use `tw refresh` to clear all cache

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - see LICENSE file for details

## Security

- Credentials are stored in environment files (never committed)
- Uses HTTPS for all API communications
- Basic Auth with secure base64 encoding
- No credential logging or exposure

## Support

If you encounter issues:

1. Check your `.env` configuration
2. Verify your Teamwork API credentials
3. Ensure all dependencies are installed
4. Check network connectivity to your Teamwork instance

For bugs and feature requests, please open an issue on GitHub.