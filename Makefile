.PHONY: publish
publish:
	wget -O _notes/publications.md https://raw.githubusercontent.com/brian-avery/publications/master/talks/README.md
	git commit -am "$(shell date +%F_%T)"
	git push
.PHONY: serve
serve:
	bundle exec jekyll serve
