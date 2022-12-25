.PHONY: docs

serve:
	./node_modules/.bin/nodemon --signal SIGTERM --watch '.' --ext go,js,css,html --exec 'go run . serve || exit 1'
watch:
	npm run "build:watch"
docs:
	cd docs && mdbook serve --open

sample:
	go build && ./paisa init && ./paisa update && ./paisa serve

publish:
	nix develop --command bash -c 'cd docs && mdbook build'

lint:
	./node_modules/.bin/prettier --check src
	npm run check
	test -z $$(gofmt -l .)

windows:
	GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CXX=x86_64-w64-mingw32-g++ CC=x86_64-w64-mingw32-gcc go build


deploy:
	docker build -t paisa .
	fly deploy -i paisa:latest --local-only
