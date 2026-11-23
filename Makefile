export BYLAWS_BUILD_PLUGIN_FROM_SOURCE := 1

.PHONY: lint test clean

lint:
	swift run bylaws lint --skip-tests

test:
	swift test

clean:
	rm -rf .build
