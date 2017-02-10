on hazelProcessFile(theFile)
	
	set startDate to (current date) - 20 * minutes
	set filepath to alias "HD:Users:User:Documents"
	
	tell application "OmniFocus"
		tell front document
			set theContext to first flattened context where its name = "context"
			set theTask to name of every flattened task where its context = theContext and completed = true and completion date is greater than startDate
			set flaggedTask to name of every flattened task where its flagged is true and its completed is not true and its modification date is greater than startDate
		end tell
	end tell
	
	if number of theTask is greater than 0 then
		
		tell application "Finder"
			set filename to name of every file in filepath whose label index is not 6
			repeat with theFile in filename
				set t to text 1 thru -11 of theFile
				
				if theTask contains t then
					
					set newString to {}
					repeat with i in theFile
						if (i as string) is " " then
							set end of newString to "\\ "
						else
							set end of newString to (i as string)
						end if
					end repeat
					
					set n to newString as string
					
					do shell script "/usr/local/bin/tag -s 2.Arranging ~/Documents/" & n
				end if
				
				if theTask contains t then
					
					set newString to {}
					repeat with i in theFile
						if (i as string) is " " then
							set end of newString to "\\ "
						else
							set end of newString to (i as string)
						end if
					end repeat
					
					set n to newString as string
					
					do shell script "/usr/local/bin/tag -s 3.Complete ~/Documents/" & n
				end if
				
			end repeat
		end tell
		
	end if
	
	if number of flaggedTask is greater than 0 then
		
		tell application "Finder"
			set filename to name of every file in filepath whose label index is not 6
			repeat with theFile in filename
				set t to text 1 thru -11 of theFile
				
				if flaggedTask contains t then
					
					set newString to {}
					repeat with i in theFile
						if (i as string) is " " then
							set end of newString to "\\ "
						else
							set end of newString to (i as string)
						end if
					end repeat
					
					set n to newString as string
					
					do shell script "/usr/local/bin/tag -a 0.Flagged ~/Documents/" & n
				end if
				
			end repeat
		end tell
		
	end if
	
end hazelProcessFile
