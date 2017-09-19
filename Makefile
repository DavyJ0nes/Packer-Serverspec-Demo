all: test

test:
	$(call blue, "# Testing App...")
	cd playbooks && bundle install && kitchen test

define blue
	@tput setaf 4
	@echo $1
	@tput sgr0
endef
