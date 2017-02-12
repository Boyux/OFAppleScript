on hazelProcessFile(theFile)
	
	set theDate to (current date) - 20 * minutes
	
	tell application "OmniFocus"
		tell front document
			set theProject to first flattened project where its name is "theProject"
			set theTime to modification date of theProject
			if theTime is greater than theDate then
				set theTask to every task in theProject where its completed is not true and its estimated minutes is missing value
				repeat with t in theTask
					set estimated minutes of t to 5
				end repeat
			end if
		end tell
	end tell
	
end hazelProcessFile