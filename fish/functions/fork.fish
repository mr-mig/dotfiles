function fork -d "Fork the current repo on github and override remote names"
	hub fork
	git remote rename origin upstream
	git remote rename mr-mig origin
	git branch master -u origin/master
end 
