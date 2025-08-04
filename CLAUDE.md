# Teamwork CLI Project Memory

## Project Overview

This is a command-line interface for Teamwork.com project management system written in Bash. The main executable is `tw` which provides task management, project selection, filtering, and AI-powered summaries.

## Key Technical Details

### Core Technologies
- **Language**: Bash script
- **Dependencies**: curl, jq, claude (Claude Code CLI)
- **Authentication**: Basic Auth with base64 encoding
- **API**: Teamwork API v3

### Project Structure
- `tw` - Main executable script
- `.env` / `~/.tw.env` - Configuration files
- Cache stored in temp directory

### Important Commands
- `tw` - Interactive project selection
- `tw tasks` - List tasks with various filters
- `tw task <id|name>` - View single task details
- `tw summary <id|name>` - AI task summary
- `tw open <id|name>` - Open task in browser automatically
- `tw refresh` - Clear cache
- `tw flags` - Show help

### Configuration Requirements
Required environment variables:
- `TEAMWORK_URL` - Base URL (e.g., https://company.teamwork.com)
- `API_KEY` - User's API key
- `PASSWORD` - User's password
- `USER_ID` - Numeric user ID
- `PROJECT_IDS` - Optional fallback project IDs

### API Endpoints Used
- `/projects/api/v3/projects.json` - User's projects
- `/projects/api/v3/tasks.json` - All tasks
- `/projects/api/v3/projects/{id}/tasks.json` - Project tasks
- `/projects/api/v3/tasks/{id}.json` - Task details
- `/projects/api/v3/tasks/{id}/comments.json` - Task comments
- `/projects/api/v3/tags.json` - Available tags

### Filtering Options
- `--priority=high|medium|low`
- `--due=today|tomorrow|overdue|YYYY-MM-DD`
- `--start=today|tomorrow|YYYY-MM-DD`
- `--tags="tag1,tag2"`
- `--summary` or `--summary=long` - AI summaries

### Caching Strategy
- Task-based cache validation
- Stores task data with timestamps
- Automatic invalidation on task updates
- Cross-project cache persistence

### AI Integration
- Uses Claude CLI for task summaries
- Analyzes task title, description, and comments
- Provides actionable next steps
- Two modes: short inline summaries and detailed summaries

### Security Considerations
- Credentials stored in environment files (never in code)
- HTTPS-only API communication
- Basic Auth with secure encoding
- No credential logging

### Development Notes
- Main logic in single `tw` script
- Interactive UI using select menus
- Clean terminal output formatting
- Error handling for API failures
- Support for both global and local config

### Testing Commands
When making changes, test with:
```bash
./tw flags              # Verify help works
./tw                    # Test interactive mode
./tw tasks              # Test basic task listing
./tw task 123456        # Test single task view
./tw task 123456 --comments # Test comments display
./tw tasks --summary    # Test AI integration
./tw open 123456        # Test browser opening
./tw refresh            # Test cache clearing
```

### Common Issues
1. Missing dependencies - ensure curl, jq, claude installed
2. Invalid credentials - check .env configuration
3. Network issues - verify Teamwork URL accessibility
4. Cache problems - use `tw refresh` to clear

### Future Enhancement Ideas
- Task creation/update capabilities
- Time tracking integration
- Project statistics
- Bulk operations
- Export functionality