repeat 2 times
	delay 0.2
	tell application "Keychain Access"
		activate
		--grabbing "Name" field
		tell application "System Events"
			delay 0.2
			keystroke return
			
			-- Press ?C to copy item title
			delay 0.2
			keystroke "c" using command down
		end tell
	end tell
	
	--Switch to TextEdit
	delay 0.2
	tell application "TextEdit"
		activate
		tell application "System Events"
			-- Press ?V
			delay 0.2
			keystroke "v" using command down
			
			-- Type a comma
			delay 0.2
			keystroke ","
			
		end tell
	end tell
	
	--Switch to Keychain
	--Grab "Where" aka the URL field
	tell application "Keychain Access"
		activate
		tell application "System Events"
			-- Press Tab x2 
			delay 0.1
			keystroke tab
			delay 0.1
			keystroke tab
			delay 0.1
			keystroke tab
			
			-- Press ?C
			delay 0.2
			keystroke "c" using command down
		end tell
	end tell
	
	--Switch to TextEdit
	delay 0.2
	tell application "TextEdit"
		activate
		tell application "System Events"
			-- Press ?V
			delay 0.2
			keystroke "v" using command down
			
			-- Type ','
			delay 0.2
			keystroke ","
		end tell
	end tell
	
	--Switch to Keychain
	--grab the "account" field
	tell application "Keychain Access"
		activate
		tell application "System Events"
			-- Press Tab x2 
			delay 0.1
			keystroke tab using shift down
			
			
			-- Press ?C
			delay 0.2
			keystroke "c" using command down
		end tell
	end tell
	
	--Switch to TextEdit
	delay 0.2
	tell application "TextEdit"
		activate
		tell application "System Events"
			-- Press ?V
			delay 0.2
			keystroke "v" using command down
			
			-- Type ','
			delay 0.2
			keystroke ","
		end tell
	end tell
	
	--Switch to Keychain
	tell application "Keychain Access"
		activate
		tell application "System Events"
			-- Click the ÒShow password:Ó checkbox.
			delay 0.2
			keystroke "c" using {shift down, command down}
			
			-- Type password - update to yours
			delay 0.5
			keystroke "PASSWORD-HERE" --UPDATE WITH YOUR OWN PASSWORD THAT WILL UNLOCK KEYCHAIN ITEMS HERE
			delay 0.2
			keystroke return
			
			-- Close keychain item window
			delay 0.3
			keystroke "w" using command down
			
			-- Go to next keychain item
			delay 0.2
			key code 125
		end tell
	end tell
	
	--Switch to TextEdit
	delay 0.2
	tell application "TextEdit"
		activate
		tell application "System Events"
			-- Press ?V
			delay 0.2
			keystroke "v" using command down
			
			-- Press Return
			delay 0.2
			keystroke return
		end tell
	end tell
end repeat
end run