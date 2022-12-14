use scripting additions

tell application "System Preferences"
	quit
	delay 0.5
	launch
	activate
	set current pane to pane "com.apple.preference.displays"
	--reveal pane id "com.apple.preference.displays"
end tell

delay 1

tell application "System Events"
	tell application process "System Preferences"
		tell window "Telas"
			click button "Ajustes de Tela…"
			delay 0.5
			tell sheet 1
				select row 1 of outline 1 of scroll area 1 -- the row with external monitor
				tell pop up button "Rotação:"
					set theRotation to value of it
					click
					tell menu "Rotação:"
						if theRotation = "Padrão" then
							click menu item "90°" -- your preferred rotation 
						else
							click menu item "Padrão"
						end if
					end tell
				end tell
				delay 1
				if exists of button "Confirmar" of sheet 1 then
					click button "Confirmar" of sheet 1
				end if
				click button "Concluído"
			end tell
			-- Could try to arrange displays here somehow...
		end tell
	end tell
end tell

delay 0.5

tell application "System Preferences"
	quit
end tell