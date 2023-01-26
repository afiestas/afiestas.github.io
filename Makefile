jekyll_path := $(PWD)/jekyll/
build:
	sudo docker run --rm -v "${jekyll_path}:/srv/jekyll" jekyll/jekyll:4.2.2 jekyll build

serve:
	sudo docker run --rm -v "${jekyll_path}:/srv/jekyll" -it --publish 4000:4000 jekyll/jekyll:4.2.2 jekyll serve