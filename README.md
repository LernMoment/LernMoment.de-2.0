# Install
1. Install [Ruby](https://gorails.com/setup/).
2. Install Bundler with `gem install bundler`.
3. Do `bundle install` in this dir.
4. Install [NPM](https://docs.npmjs.com/getting-started/installing-node).
5. Do `npm install` in this dir.

# Watch
Do `bundle exec jekyll s` in this dir. Something seems slow and buggy here at the moment. If live reload does not work correctly, stop it and restart it.

# Build
Do `gulp build` in this dir.

# Deploy
Not my problem. ;)

# Create new "LernMoment Iterationen"
1. Copy file `string.md` in folder `iterations`.
2. Rename copied file for nice URL.
3. You need to change frontmatter entries `iteration-shorthands` to a shorthand name of your choice.
4. Use this shorthand in the blog posts in folder `_posts` in a frontmatter entry `iteration,` (like this: `iteration: strings`) to add it to the "LernMoment Iterationen".