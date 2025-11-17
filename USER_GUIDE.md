# Accessible Radio Player - User Guide

## Welcome!

Thank you for using the Accessible Radio Player! This app has been specifically designed with accessibility in mind, making it easy for blind and visually impaired users to enjoy online radio streaming and recording.

## Getting Started

### First Launch

When you first open the app, you'll see three tabs at the bottom:
1. **Stations** - Manage your radio stations
2. **Player** - Control playback
3. **Recordings** - View and manage your recordings

The app will announce which screen you're on when you switch tabs.

### Enabling TalkBack (Android Screen Reader)

If you haven't already enabled TalkBack:
1. Go to Android Settings
2. Select Accessibility
3. Turn on TalkBack
4. The app works seamlessly with TalkBack for full voice guidance

## Adding Your First Radio Station

### Step-by-Step Instructions

1. **Open the Stations Tab**
   - The app will announce: "Navigated to Stations screen"
   
2. **Tap the Add Button**
   - Look for the "+" button (floating action button at bottom-right or in the top menu)
   - TalkBack will read: "Add new station"
   
3. **Enter Station Details**
   - **Station Name**: Enter a friendly name (e.g., "Jazz FM", "News Radio")
   - **Stream URL**: Enter the complete streaming URL
     - Must start with `http://` or `https://`
     - Example: `http://ice1.somafm.com/groovesalad-128-mp3`
   
4. **Save the Station**
   - Tap the "Add" button
   - The app will announce: "Station [name] added successfully"

### Finding Radio Stream URLs

To find streaming URLs for your favorite radio stations:
1. Visit the radio station's website
2. Look for "Listen Live" or "Stream" links
3. Right-click and copy the stream URL
4. Common formats: `.mp3`, `.aac`, `.pls`, `.m3u`

### Example Stations to Try

Here are some free, public radio streams you can add:

**SomaFM Groove Salad** (Ambient/Chill)
- Name: `SomaFM Groove Salad`
- URL: `http://ice1.somafm.com/groovesalad-128-mp3`

**181.FM The Buzz** (Alternative Rock)
- Name: `The Buzz`
- URL: `http://listen.181fm.com/181-buzz_128k.mp3`

**Radio Swiss Jazz**
- Name: `Radio Swiss Jazz`
- URL: `http://stream.srg-ssr.ch/rsj/mp3_128`

## Playing a Radio Station

### Starting Playback

1. **Navigate to Stations Tab**
   - Swipe or tap to reach the Stations screen
   
2. **Select a Station**
   - Swipe through the list of stations
   - Double-tap on the station you want to play
   - The app will announce: "Now playing [station name]"
   
3. **View Player Controls**
   - Navigate to the Player tab to see full controls
   - The app will show the station name and playback buttons

### Playback Controls

In the **Player** tab, you'll find:

**Stop Button** (left)
- Stops playback completely
- Announcement: "Playback stopped"

**Play/Pause Button** (center, large)
- Toggles between play and pause
- Announcements:
  - "Now playing [station name]"
  - "Playback paused"

**Record Button** (right, red when recording)
- Starts/stops recording the current stream
- See "Recording" section below

### Background Playback

The app supports background playback:
- You can minimize the app and the radio will keep playing
- Use notification controls to pause/resume
- The app will keep playing even when the screen is off

## Recording Radio Streams

### Starting a Recording

1. **Play a Station First**
   - You must be playing a station to record it
   
2. **Navigate to Player Tab**
   - The current station should be playing
   
3. **Tap the Record Button**
   - It's the circular button on the right side
   - The app will announce: "Recording started for [station name]"
   - The button will turn red and show a recording indicator
   
4. **Recording in Progress**
   - A red banner will appear: "Recording in progress"
   - The station will continue playing while recording
   - You can still use other controls

### Stopping a Recording

1. **Tap the Record Button Again**
   - The same button you used to start
   - The app will announce: "Recording stopped"
   
2. **Find Your Recording**
   - Navigate to the Recordings tab
   - Your new recording will appear at the top of the list

### Recording Details

- **Format**: M4A (AAC audio)
- **Quality**: 128 kbps, 44.1 kHz
- **Location**: App's document directory
- **File Names**: Automatically named with station name and timestamp

### Important Notes About Recording

⚠️ **Permissions Required**
- The app needs microphone permission to record
- You'll be prompted to grant this permission
- This is standard for audio recording apps

⚠️ **Storage Space**
- Recordings use approximately 1 MB per minute
- Check available storage before long recordings
- Delete old recordings to free up space

⚠️ **Legal Considerations**
- Only record content you have permission to record
- Respect copyright laws in your region
- Personal use recordings are typically acceptable

## Managing Your Recordings

### Viewing Recordings

1. **Navigate to Recordings Tab**
   - The app will announce: "Navigated to Recordings screen"
   
2. **Browse Your Recordings**
   - Each recording shows:
     - File name (includes station name and date)
     - File size
     - Date and time created
   
3. **Recording Information**
   - Swipe through the list with TalkBack
   - Each item will be read aloud with full details

### Deleting a Recording

1. **Select a Recording**
   - Swipe to the recording you want to delete
   
2. **Tap the Delete Button**
   - It's on the right side of each recording
   - TalkBack will announce: "Delete recording"
   
3. **Confirm Deletion**
   - A dialog will ask: "Are you sure?"
   - Tap "Delete" to confirm or "Cancel" to keep it
   - The app will announce: "Recording deleted"

### Refreshing the List

- Tap the refresh icon in the top-right corner
- This updates the list if you've added recordings externally

## Managing Stations

### Marking Favorites

1. **Find the Station**
   - In the Stations tab, locate the station
   
2. **Tap the Heart Icon**
   - Each station has a heart icon
   - Tap once to mark as favorite (filled red heart)
   - Tap again to remove from favorites (empty heart)

### Deleting a Station

1. **Locate the Station**
   - In the Stations tab, find the station to delete
   
2. **Tap the Delete Icon**
   - It's the red trash can icon on the right
   - TalkBack will announce: "Delete station"
   
3. **Confirm Deletion**
   - The station will be removed immediately
   - The app will announce: "Station [name] deleted"

### Editing a Station

Currently, to edit a station:
1. Delete the old station
2. Add a new station with the updated information

## Accessibility Features

### Voice Announcements

The app provides spoken feedback for all major actions:

- **Playback**: "Now playing [station]", "Playback paused", "Playback stopped"
- **Recording**: "Recording started for [station]", "Recording stopped"
- **Station Management**: "Station [name] added successfully", "Station [name] deleted"
- **Navigation**: "Navigated to [screen] screen"
- **Errors**: Clear error messages are spoken

### TalkBack Optimization

- All buttons have descriptive labels
- All images have alternative text
- Proper focus order for easy navigation
- Semantic grouping of related elements
- Large touch targets (minimum 48x48 dp)

### Visual Accessibility

- High contrast color scheme
- Large, readable fonts (18sp body text, 24sp headings)
- Clear visual indicators for active states
- Color is never the only indicator (icons + text)
- Material Design 3 for modern, accessible UI

### Navigation Tips with TalkBack

- **Swipe Right**: Move to next element
- **Swipe Left**: Move to previous element
- **Double-Tap**: Activate the current element
- **Two-Finger Swipe Up**: Read from top
- **Two-Finger Swipe Down**: Read from current position
- **Three-Finger Swipe**: Navigate between tabs

## Permissions Explained

The app requests the following permissions:

### Internet Access
- **Why**: To stream radio stations
- **When**: Always active
- **Privacy**: No personal data is collected

### Microphone
- **Why**: To record radio streams
- **When**: Only when you start recording
- **Privacy**: Only used for recording, never for listening

### Storage
- **Why**: To save recordings
- **When**: When you record or access recordings
- **Privacy**: Only app recordings are accessed

### Wake Lock
- **Why**: To keep playing when screen is off
- **When**: During playback
- **Privacy**: No data access, just prevents sleep

## Troubleshooting

### Station Won't Play

**Problem**: Tapping a station doesn't start playback

**Solutions**:
1. Check your internet connection
2. Verify the stream URL is correct
3. Try a different station to test
4. Some streams may be geo-restricted
5. The station's server might be down

### Recording Not Working

**Problem**: Record button doesn't work

**Solutions**:
1. Grant microphone permission in Android Settings
2. Check available storage space
3. Ensure a station is playing first
4. Restart the app and try again

### No Sound

**Problem**: Playback shows as playing but no sound

**Solutions**:
1. Check device volume
2. Check if device is muted
3. Try using headphones
4. Restart the app
5. Check if other apps can play sound

### App Crashes

**Problem**: App closes unexpectedly

**Solutions**:
1. Restart your device
2. Clear app cache in Android Settings
3. Ensure you have the latest version
4. Check for Android system updates

### TalkBack Not Working

**Problem**: Voice announcements not heard

**Solutions**:
1. Verify TalkBack is enabled in Android Settings
2. Check TalkBack volume settings
3. Restart TalkBack
4. Restart the app

## Tips and Tricks

### Battery Saving
- Use the Stop button instead of Pause for long breaks
- Close the app when not in use
- Lower screen brightness during playback

### Data Usage
- Radio streaming uses approximately 1 MB per minute
- Use Wi-Fi when possible to save mobile data
- Lower quality streams use less data

### Best Recording Practices
- Test record for a few seconds first
- Ensure stable internet connection
- Keep device charged during long recordings
- Close other apps to ensure smooth recording

### Organization
- Use clear, descriptive station names
- Mark frequently used stations as favorites
- Delete old recordings regularly to save space
- Group similar stations with naming conventions (e.g., "Jazz - Station Name")

## Privacy and Data

### What Data is Collected?
- **None**: This app does not collect any personal data
- **No Analytics**: No usage tracking
- **No Ads**: No advertising networks

### What Data is Stored Locally?
- Station names and URLs (in app database)
- Recordings (in app documents folder)
- App preferences (playback state, etc.)

### Data Sharing
- **No Data Shared**: All data stays on your device
- **No Internet Uploads**: Recordings are never uploaded
- **No Third-Party Services**: Except for streaming from radio stations

## Support and Feedback

### Getting Help
- Re-read this guide for detailed instructions
- Check the Troubleshooting section
- Consult Android accessibility documentation

### Reporting Issues
- Note the exact steps that cause the problem
- Check if the issue happens with all stations or just one
- Try the solutions in the Troubleshooting section

## Keyboard Shortcuts (External Keyboard)

If you use an external keyboard with your Android device:
- **Space**: Play/Pause
- **S**: Stop
- **R**: Start/Stop Recording
- **Tab**: Navigate between elements
- **Enter**: Activate selected element

## Frequently Asked Questions

**Q: Can I play my own music files?**
A: No, this app is specifically for streaming online radio stations.

**Q: Does the app work offline?**
A: No, you need an internet connection to stream radio. Recordings can be played offline.

**Q: Can I schedule recordings?**
A: Not in the current version. You must manually start and stop recordings.

**Q: How many stations can I add?**
A: There's no limit! Add as many as you like.

**Q: Can I export recordings?**
A: Recordings are saved in the app's directory. You can access them via file manager apps.

**Q: Does the app support podcasts?**
A: No, it's designed for live radio streaming only.

**Q: Can I change the recording quality?**
A: Not in the current version. All recordings are 128 kbps AAC.

## Version Information

**Current Version**: 1.0.0
**Release Date**: November 2025
**Compatibility**: Android 5.0 (Lollipop) and above

## Credits

This app was created with accessibility as the primary focus, ensuring that everyone can enjoy online radio regardless of visual ability.

**Technologies Used**:
- Flutter framework
- just_audio for playback
- record for audio recording
- flutter_tts for voice feedback
- SQLite for data storage

---

**Enjoy your radio experience!** 📻

For more information, see the README.md file included with the app.
