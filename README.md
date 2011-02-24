# gitPaper

Backup Instapaper bookmarks to git.

This should be considered alpha, I'm still planning on changing how bookmarks are stored in the repo.

## USAGE

To use the gem just run `rake build` then gem install from the pkg directory. Let me know if anything blows up.

gitPaper requires a repo with an initial commit.

You'll need your own OAuth token from Instapaper - http://www.instapaper.com/main/request_oauth_consumer_token

Run `gitpaper --auth` with --user, --pass, --token, and --secret to get your token from Instapaper.

Then `gitpaper --import` use --limit to limit the number of bookmarks imported. API limit is 500, always grabs latest bookmarks first.

## TODO

* Tests
* Finalize storage
* Read repo and send 'have' param to API when requesting bookmarks
* Front end to repo...maybe

## Credit Due

This is heavily based off of [Madrox](http://github.com/technoweenie/madrox) and [Twurl](https://github.com/marcel/twurl).