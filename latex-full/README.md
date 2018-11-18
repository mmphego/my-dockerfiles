#  LaTeX Docker

Simplified LaTeX docker image for compiling latex files. Details of the package can be found on http://packages.ubuntu.com/xenial/texlive-full.

## Softwares installed

* Ubuntu: xenial
* textlive-full
* gnuplot
* chktex
* latexmk
* texlive-latex-extra
* python-pygments
* git

## Usage

- Build image

```shell
$ make build
```

- Compile LaTeX

```shell
# Command broken ie needs somework
# make latex
# Way around
./latexgen main.tex
```

Or just execute `make help`

## Feedback

Feel free to fork it or send me PR to improve it.