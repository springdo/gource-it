# gource-it!
Gource git visualisation script for creating a combined gource video across a collection of repos. This repo will scrape a collection of repositories and generate the gource text files. It then prefixes each gource video with the repo name giving a single view before running and compressing the video into an mp4 format.

## Pre reqs
Have [Gource](http://gource.io/) and [ffmpeg](https://www.ffmpeg.org/) installed. On a Mac, with brew installed this is as easy as:

```
brew install ffmpeg
brew install gource
```

## run it!
1. Move the  `./gource.sh` script to a dir containing a collection of repositories.
1. Run `./gource.sh` which will play the video. Once this has been completed, it will be compressed to a smaller file size. This can take sometime depending on the video length.
