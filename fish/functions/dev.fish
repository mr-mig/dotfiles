function dev -a subdir -d "Subdir to development dir"
	if test -z $subdir
		echo "cd to dev"
		eval "cd ~/dev"
	else
		eval "cd ~/dev/$subdir"
	end
end 