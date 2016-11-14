.PHONY: test brew symlink

test:
	rake spec

brew:
	./init/brew.sh

symlink:
	./init/symlink.sh
