do shell script "open 'x-apple.systempreferences:com.apple.Displays-Settings.extension'"
delay 0.5

tell application "System Events"
	tell application process "System Settings"
		tell splitter group 1 of group 1 of window 1
			select row 21 of outline 1 of scroll area 1 of group 1
			delay 1
			tell group 1 of group 2
				click button 1 of scroll area 1 --choose monitor
				tell scroll area 2
					tell pop up button 1 of group 4
						set theRotation to value of it
						log theRotation
						click
						delay 0.5
						tell menu 1
							if theRotation = "Standard" then
								click menu item "90°" -- your preferred rotation 
							else
								click menu item "Standard"
							end if
						end tell
						
						delay 0.5
					end tell
				end tell
			end tell
		end tell
	end tell
end tell

quit application "System Settings"
