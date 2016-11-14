.PHONY: test brew shell symlink

test:
	rake spec

brew:
	./init/brew.sh

shell:
	./init/shell.sh

symlink:
	./init/symlink.sh
