add-all:
	mkdir -p ~/.ssh
	touch ~/.ssh/authorized_keys
	chmod 644 ~/.ssh/authorized_keys

	cat keys/*.pub >> ~/.ssh/authorized_keys

setup-homed:
	find keys/ -name '*.pub' | xargs -I '%' -n '1' homectl update $USER --ssh-authorized-keys '@%'
