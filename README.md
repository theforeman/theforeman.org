# theforeman.org

This repo contains the source code for
[theforeman.org](http://theforeman.org). All of the site's content is written in
[Markdown](http://daringfireball.net/projects/markdown/syntax). If you're not familiar with it, fear not; it's easy
to learn and to become rapidly productive!

Everything you push into the gh-pages branch goes live immediately!

## Testing locally

To test your changes locally use

    # rake

to generate your site in the \_site directory, or

    # rake server

To start Jekyll server locally.

## Contributing

1. Fork this repo to your account.
2. Clone the fork.
3. Run `bundle install` in the root of the freshly cloned repo. This
   will install Jekyll, the tool we use to build the site.
4. Run `jekyll serve --watch` and open your browser to http://localhost:4000.
5. Make some changes, refresh your browser to preview them.
6. Submit a pull request.

## Contributing a blog post

1. (following on from step 5 above)
2. Run `rake new_post['title of my post']` to generate a new empty blog post
3. Edit _posts/YYYY-MM-DD-title\_of\_my\_post.md
4. Set the author correctly, and appropriate tags (see previous posts for examples)
5. Add content, and preview as above.
6. Submit PR

## New release actions

For each new release we keep stable documentation tree for the record.

### Foreman Core

1. cp -r manuals/X.Y manuals/X.Z
1. change version numbers in manuals/1.10/*.md
1. add version to documentation.md

### Foreman Plugins

1. cp -r plugins/foreman_plugin/X.Y plugins/foreman_plugin/X.Z
1. add "warning: old" to plugins/foreman_plugin/X.Y/index.md
1. update plugins/foreman_plugin/index.md

## Updating API Auto-Generated Docs by apipie

Generate API docs in Foreman

1. cd to foreman directory
2. rake apipie:cache

Prepare folder for the new version (X.Y)

3. cd to theforeman.org/api directory
4. cp -r new_version_template X.Y
5. edit file X.Y/index.md and set correct version

Copy docs to repo

6. cp -r dir/to/foreman/public/apipie-cache/apidoc/* Y.Y/apidoc
