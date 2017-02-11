on hazelProcessFile(theFile)
	
	set startDate to (current date) - 20 * minutes
	set filepath to alias "HD:Users:User:Documents:Work"
	
	tell application "OmniFocus"
		tell front document
			set theFolder to first flattened folder where its name = "Folder"
			set subFolder to every folder of theFolder
			repeat with f in subFolder
				set theProject to (name of every project of f where its modification date is greater than startDate)
				if number of theProject is greater than 0 then
					repeat with p0 in theProject
						
						tell application "Finder"
							set foldername0 to name of every folder in filepath
							if foldername0 does not contain p0 then
								tell application "Finder" to make new folder at filepath with properties {name:p0}
							end if
						end tell
						
					end repeat
				end if
			end repeat
			
		end tell
	end tell
	
	tell application "OmniFocus"
		tell front document
			set theFolder to first flattened folder where its name = "Folder"
			set subFolder to every folder of theFolder
			set theList to {}
			repeat with f in subFolder
				
				set theProject to every project of f
				repeat with p in theProject
					set theTime to modification date of p
					if theTime is greater than startDate then
						copy name of p to end of theList
					end if
				end repeat
				
				if theList is not equal to {} then
					
					set activeProject to (name of every project of f where its status is not on hold and completed is not true and status is not dropped and its modification date is greater than startDate)
					repeat with p1 in activeProject
						
						set newString to {}
						repeat with i1 in p1
							if (i1 as string) is " " then
								set end of newString to "\\ "
							else
								set end of newString to (i1 as string)
							end if
						end repeat
						
						set n1 to newString as string
						
						tell application "Finder"
							set foldername1 to (name of every folder in filepath whose label index is not 5)
							if foldername1 contains p1 then
								do shell script "/usr/local/bin/tag -s Active ~/Documents/" & n1
							end if
						end tell
					end repeat
					
					set pauseProject to (name of every project of f where its status is on hold and its modification date is greater than startDate)
					repeat with p2 in pauseProject
						
						set newString to {}
						repeat with i2 in p2
							if (i2 as string) is " " then
								set end of newString to "\\ "
							else
								set end of newString to (i2 as string)
							end if
						end repeat
						
						set n2 to newString as string
						
						tell application "Finder"
							set foldername2 to (name of every folder in filepath whose label index is not 5)
							if foldername2 contains p2 then
								do shell script "/usr/local/bin/tag -s Onhold ~/Documents/" & n2
							end if
						end tell
					end repeat
					
					set flaggedProject to (name of every project of f where its flagged is true and its completed is not true and its status is not dropped and its modification date is greater than startDate)
					repeat with p5 in flaggedProject
						
						set newString to {}
						repeat with i5 in p5
							if (i5 as string) is " " then
								set end of newString to "\\ "
							else
								set end of newString to (i5 as string)
							end if
						end repeat
						
						set n5 to newString as string
						
						do shell script "/usr/local/bin/tag -a Flagged ~/Documents/" & n5
					end repeat
					
					set completedProject to (name of every project of f where its completed is true or its status is dropped and its modification date is greater than startDate)
					repeat with p3 in completedProject
						
						set newString to {}
						repeat with i3 in p3
							if (i3 as string) is " " then
								set end of newString to "\\ "
							else
								set end of newString to (i3 as string)
							end if
						end repeat
						
						set n3 to newString as string
						
						tell application "Finder"
							set foldername3 to (name of every folder in filepath whose label index is not 5)
							if foldername3 contains p3 then
								do shell script "/usr/local/bin/tag -s Completed ~/Documents/" & n3
							end if
						end tell
					end repeat
					
				end if
				
			end repeat
		end tell
	end tell
	
end hazelProcessFile