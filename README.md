# SwiftBar Plugins Collection

A collection of useful SwiftBar/xBar plugins to enhance your macOS menu bar experience with SSH connectivity and battery monitoring.


## 📦 Included Plugins

### 🖥️ iTerm SSH Menu

Connect to your SSH servers with a single click directly from your menu bar.

### 🔋 Colorful Battery Level

Monitor your battery status with a visually appealing, color-coded indicator that updates every 5 seconds.

## ⚙️ Installation

### Prerequisites

- [SwiftBar](https://github.com/swiftbar/SwiftBar) or [xBar](https://xbarapp.com/) installed
- iTerm2 for the SSH Menu plugin
- macOS 10.14 or newer

### Setup

```bash
# Clone the repository
git clone https://github.com/your-username/swiftbar-plugins.git
```

```bash
# Make scripts executable
chmod +x iTermSshMenu.sh ColorfulBatteryLevel.5s.sh
```

```bash
# Link to SwiftBar plugins directory
ln -s "$(pwd)/iTermSshMenu.sh" ~/Library/Application\ Support/SwiftBar/Plugins/
ln -s "$(pwd)/ColorfulBatteryLevel.5s.sh" ~/Library/Application\ Support/SwiftBar/Plugins/
```

## 🛠️ Configuration

### iTerm SSH Menu

<details>
<summary><b>Setting up custom servers</b></summary>

The plugin automatically reads hosts from your `~/.ssh/config` file, but you can add custom servers by editing the script:

```bash
# 👇 IMPORTANT: Edit this section to add your custom servers
echo "My Servers"
echo "--  | bash='$0' param1=ssh param2=root@ param3=ehb terminal=false"
echo "--  | bash='$0' param1=ssh param2=root@ param3=hestia terminal=false"
# ☝️ End of custom servers section
```

</details>

<details>
<summary><b>Password handling (use with caution)</b></summary>

```diff
# ⚠️ SECURITY NOTICE: Using passwords in scripts is not recommended
# Use SSH keys instead when possible

+ # Set passwords based on server type (replace with your actual passwords)
  if [ "$SERVER_TYPE" = "ehb" ]; then
-   PASSWORD=""  # Replace with your password
+   PASSWORD="your_secure_password"  # Add your password here
  fi
```

</details>

### Colorful Battery Level

<details>
<summary><b>Adjusting color thresholds</b></summary>

Edit the ColorfulBatteryLevel.5s.sh file to adjust when colors change:

```bash
# 🎨 Color configuration
LOW_THRESHOLD=20    # Battery percentage to show red
MEDIUM_THRESHOLD=50 # Battery percentage to show yellow
```

</details>

## 🚀 Usage

After installation, both plugins will appear in your menu bar:

| Plugin | Function |
|--------|----------|
| 🖥️ **SSH Menu** | Click to see available servers and connect with one click |
| 🔋 **Battery Level** | Shows current battery percentage with color-coding |

## 💡 Tips & Tricks

```bash
# 🔑 For better security, use SSH keys instead of passwords
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
ssh-copy-id user@host
```

<div style="background-color: #e6f7ff; padding: 10px; border-left: 4px solid #1890ff;">
<strong>Pro Tip:</strong> You can organize your SSH connections in <code>~/.ssh/config</code> with Host Groups:

```
Host dev*
  User developer
  IdentityFile ~/.ssh/dev_key

Host prod*
  User administrator
  IdentityFile ~/.ssh/prod_key
```
</div>

## 🐞 Troubleshooting

If you encounter issues:

- Check `/tmp/iterm_ssh_debug.log` for SSH connection errors
- Ensure correct permissions: `chmod 600 ~/.ssh/config`
- Restart SwiftBar with `killall SwiftBar && open -a SwiftBar`

## 📄 License

These scripts are released under the MIT License.

## 👏 Acknowledgments

- SwiftBar/xBar developers for the plugin framework
- Gerd Naschenweng for the original iTerm SSH Menu plugin

---

⭐ **Found these plugins useful?** Star the repository to show your support!
