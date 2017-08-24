tell application "Google Chrome"
	set t to title of active tab of first window
	set u to URL of active tab of first window
	set the clipboard to "[" & t & "](" & u & ")" as string
end tell
