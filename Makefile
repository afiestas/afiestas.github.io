build:
	sudo docker run --rm --volume="$$PWD:/srv/jekyll:Z" -it jekyll/jekyll jekyll build

serve:
	sudo docker run --rm --volume="$$PWD:/srv/jekyll:Z" -it --publish 4000:4000 jekyll/jekyll jekyll serve