build:
	sudo docker run --rm --volume="$$PWD:/srv/jekyll:Z" -it jekyll/jekyll:4.2.2 jekyll build

serve:
	sudo docker run --rm --volume="$$PWD:/srv/jekyll:Z" -it --publish 4000:4000 jekyll/jekyll:4.2.2 jekyll serve
