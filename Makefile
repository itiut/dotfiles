.PHONY: test symlink

test:
	rake spec

symlink:
	./init/symlink.sh
