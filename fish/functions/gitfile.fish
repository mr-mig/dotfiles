function gitfile -a path file -d "Fetch a file from the specified github repo"
	wget https://raw.githubusercontent.com/$path/master/$file
end 
