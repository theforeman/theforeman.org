# theforeman.org

This repo contains the source code for
[theforeman.org](https://theforeman.org). All of the site's content is written in
[Markdown](http://daringfireball.net/projects/markdown/syntax). If you're not familiar with it, fear not; it's easy
to learn and to become rapidly productive!

Everything you push into the gh-pages branch goes live immediately!

## Testing

### Locally

To test your changes locally use

    # bundle exec rake

to generate your site in the \_site directory, or

    # bundle exec rake server

To start Jekyll server locally.

### With Docker

```
docker run -it --rm -v `pwd`:/srv/jekyll:Z -p 4000:4000 jekyll/jekyll jekyll serve --watch
```

Navigate to http://localhost:4000

## Contributing

1. Fork this repo to your account.
2. Clone the fork.
3. Run `bundle install` in the root of the freshly cloned repo. This
   will install Jekyll, the tool we use to build the site.
4. Run `bundle exec jekyll serve --watch` and open your browser to http://localhost:4000.
5. Make some changes, refresh your browser to preview them.
6. Submit a pull request.

## Contributing a blog post

1. (following on from step 5 above)
2. Run `bundle exec rake new_post['title of my post']` to generate a new empty blog post
3. Edit _posts/YYYY-MM-DD-title\_of\_my\_post.md
4. Set the author correctly, and appropriate tags (see previous posts for examples)
5. Add content, and preview as above.
6. Submit PR

## New release actions

For each new release we keep stable documentation tree for the record.

### Foreman Core

1. `cp -r manuals/nightly manuals/X.Z`
1. `cp -r _includes/manuals/nightly manuals/X.Z`
1. change version numbers in manuals/X.Z/*.md
1. add version to documentation.md
1. Generate release notes using `scripts/release_notes.rb`
1. Update installer options using `scripts/installer/get_params`

### Foreman Plugins

1. cp -r plugins/foreman_plugin/X.Y plugins/foreman_plugin/X.Z
1. add "warning: old" to plugins/foreman_plugin/X.Y/index.md
1. update plugins/foreman_plugin/index.md

## Updating API Auto-Generated Docs by apipie

Follow instructions in the [apidocs github repo](https://github.com/theforeman/apidocs#adding-new-version).
