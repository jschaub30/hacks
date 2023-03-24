.PHONY: shell brew vim ubuntu

help :
	@echo "-------------------------------------------------------"
	@echo "Look in README.md for general information              "
	@echo "-------------------------------------------------------"
	@echo "shell           ... Initialize shell                   "
	@echo "brew            ... Install homebrew packages          "
	@echo "vim             ... Initialize vim                     "
	@echo
	@echo "help            ... print this message                 "
	@echo "-------------------------------------------------------"

shell:
	shell/install.sh

vim:
	vimrc/install.sh

brew:
	brew/install.sh

ubuntu:
	ubuntu/install.sh
