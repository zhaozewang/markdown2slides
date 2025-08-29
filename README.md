# Markdown2Slides

This repository is a simple slide development pipeline using Markdown. You can code the slide with markdown and the pipeline will automatically compile the slides to HTML (with Marp), and displayed in presentation mode. It also includes a live server to preview the slides in the browser to see the changes in real time. This project is generated with [Claude Code](https://www.anthropic.com/news/claude-code).

## 🚀 Quick Start

```bash
./start-dev.sh
```

This will:
- Start watching `slides.md` for changes
- Auto-compile slides to HTML when saved
- Launch live server at `http://localhost:8080`
- Auto-reload browser when slides update

## 📋 Prerequisites

Make sure you have the following installed:

### Required Dependencies

1. **Node.js** (for Marp and live-server)
   ```bash
   # Check if installed
   node --version
   
   # Install via Homebrew if needed
   brew install node
   ```

2. **Marp CLI**
   ```bash
   npm install -g @marp-team/marp-cli
   ```

3. **live-server**
   ```bash
   npm install -g live-server
   ```

4. **fswatch** (for file watching on macOS)
   ```bash
   brew install fswatch
   ```

### VS Code Setup (Optional but Recommended)

1. **Install the Run On Save Extension** (backup option):
   ```bash
   code --install-extension emeraldwalk.RunOnSave
   ```

2. **Enable VS Code Tasks** (optional):
   - Open Command Palette (`Cmd+Shift+P`)
   - Type: `Tasks: Manage Automatic Tasks in Folder`
   - Select: `Allow Automatic Tasks in Folder`

## 🛠️ Setup Instructions

### Step 1: Clone and Navigate
```bash
cd /path/to/your/slides/project
```

### Step 2: Verify Dependencies
```bash
# Check all required tools
marp --version
live-server --version
fswatch --version
```

### Step 3: Make Scripts Executable
```bash
chmod +x start-dev.sh
```

### Step 4: Test the Setup
```bash
# Start development environment
./start-dev.sh

# In another terminal, test by making a change
echo "# Test Slide" > test.md
marp test.md --no-stdin
rm test.md test.html
```

## 📝 Usage

### Development Workflow

1. **Start Development Environment**
   ```bash
   ./start-dev.sh
   ```
   - This opens your browser to `http://localhost:8080`
   - Displays your compiled slides
   - Watches for file changes

2. **Edit Slides**
   - Open `slides.md` in VS Code
   - Make your changes
   - Save the file (`Cmd+S`)

3. **Watch the Magic**
   - Terminal shows compilation progress
   - Browser automatically reloads with updates
   - No manual refresh needed!

4. **Stop Development**
   - Press `Ctrl+C` in terminal to stop both watcher and server

### VS Code Integration

#### Option 1: Use VS Code Tasks (Recommended)
- Press `Cmd+Shift+P` → `Tasks: Run Build Task`
- Or press `Cmd+Shift+B` (default build shortcut)
- This runs the same `start-dev.sh` script

#### Option 2: Run On Save Extension (Backup)
- The extension is configured to run `marp slides.md` on save
- Check `View > Output` → Select "Run On Save" to see logs

### Manual Compilation
If you just want to compile without the development server:
```bash
marp slides.md --no-stdin
```

## 📁 Project Structure

```
your-project/
├── slides.md              # Your slide content
├── slides.html            # Generated HTML (auto-updated)
├── start-dev.sh           # Main development script
├── .vscode/
│   ├── tasks.json         # VS Code task configuration
│   └── settings.json      # VS Code workspace settings
└── README.md              # This file
```

## ⚙️ Configuration

### Customizing the Development Script

Edit `start-dev.sh` to customize:

- **Port**: Change `--port=8080` to your preferred port
- **Watch delay**: Modify `--wait=1000` for reload timing
- **Additional files**: Add more files to watch with `fswatch`

### VS Code Settings

The `.vscode/settings.json` contains:
- Run On Save configuration for backup auto-compilation
- File watcher exclusions for better performance

### Marp Configuration

Create `marp.config.js` for advanced Marp settings:
```javascript
module.exports = {
  inputDir: '.',
  output: 'slides.html',
  themeSet: 'themes',
  // Add your custom themes and settings
}
```

## 🔧 Troubleshooting

### Common Issues

1. **"fswatch not found"**
   ```bash
   brew install fswatch
   ```

2. **"marp not found"**
   ```bash
   npm install -g @marp-team/marp-cli
   ```

3. **"live-server not found"**
   ```bash
   npm install -g live-server
   ```

4. **Browser doesn't auto-reload**
   - Check that live-server started successfully
   - Verify slides.html is being updated (check timestamps)
   - Try refreshing manually once

5. **VS Code tasks not working**
   - Restart VS Code completely
   - Enable automatic tasks: `Tasks: Manage Automatic Tasks in Folder`

6. **Permission denied on scripts**
   ```bash
   chmod +x start-dev.sh
   ```

### Debug Mode

To see what's happening:
```bash
# Run with verbose output
./start-dev.sh
# Watch the terminal for compilation messages
```

### Manual Testing

Test each component individually:
```bash
# Test file watching
fswatch -o slides.md

# Test compilation
marp slides.md --no-stdin

# Test live server
live-server --port=8080 --entry-file=slides.html
```

## 🎯 Tips & Best Practices

1. **Keep slides.md focused**: The watcher specifically watches this file
2. **Use relative paths**: For images and assets in your slides
3. **Check terminal output**: Always visible feedback on compilation status
4. **Git ignore slides.html**: Add to `.gitignore` since it's auto-generated
5. **Backup your work**: The development environment doesn't auto-save VS Code files

## 📚 Additional Resources

- [Marp Documentation](https://marp.app/)
- [Marp CLI Guide](https://github.com/marp-team/marp-cli)
- [VS Code Tasks Documentation](https://code.visualstudio.com/docs/editor/tasks)
