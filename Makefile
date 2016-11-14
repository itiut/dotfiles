.PHONY: test brew loginshell symlink

test:
	rake spec

brew:
	./init/brew.sh

loginshell:
	./init/loginshell.sh

symlink:
	./init/symlink.sh
