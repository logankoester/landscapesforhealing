# Landscapes for Healing

> The static site generator that runs [landscapesforhealing.com](http://landscapesforhealing.com)

This website is powered by the [nanoc](http://nanoc.ws) static site generator
and the [Zurb Foundation](http://foundation.zurb.com/) front-end framework.

## Installation

### Requirements

  * Ruby 1.9+
  * [Bundler](http://gembundler.com/): `gem install bundler`
  * [Node.js](http://nodejs.org)
  * [bower](http://bower.io): `npm install bower -g`

### Quick start

```bash
$ git clone git@github.com:logankoester/landscapesforhealing.git
$ cd landscapesforhealing
$ bundle install
$ npm install
$ bower install
$ nanoc compile
$ nanoc view
```
The website will now be running at http://localhost:3000.

## Development

To compile the website, run `nanoc compile`. To recompile automatically when
a file is changed, run `guard start`.

### Adding pages

To add a new page, simply create a [Markdown](http://kramdown.gettalong.org/quickref.html)
file under `content/`, with some [YAML](http://www.yaml.org/YAML_for_ruby.html)
metadata at the top. The filename will determine the URL.

The `title` attribute is required.

### Articles

If your page should be an article (blog entry), set `kind: article` and
`created_at: YYYY-MM-DD`. This will add it to the [Atom feed](http://landscapesforhealing.com/atom.xml),
set an introductory sidebar panel, and display the `created_at` date on the page.

You should also set `menu: articles`, so it appears in the menu.

### Menus

To add a page to the top navigation, set the attribute `menu: top`.

To add a page to the sidebar menu ("Further reading"), set `menu: articles`.

If you set a `menu` attribute, you may also set a numeric `position` attribute,
relative to the other pages in the menu.

### Panels

A page can add an optional sidebar panel by including an [ERB](http://www.ruby-doc.org/stdlib-2.1.5/libdoc/erb/rdoc/ERB.html)
block with content for `:panel`.

Example:

```erb
<% content_for :panel do %>
  <h1>Panel content</h1>
<% end %>
```

You must use HTML, not Markdown syntax inside the panel content.

### Upgrading Zurb Foundation

```bash
$ bower update
```

### Bower and RequireJS

Frontend javascript is structured as AMD modules (bundled at compile-time),
and external frontend packages are managed by [Bower](http://bower.io) under
`components/`.

A preprocess hook (`optimize_rjs`) on the nanoc compiler uses the
[r.js](https://github.com/jrburke/r.js) optimizer to bundle all JavaScript
into `output/js/app.bundle.js`, which is excluded from pruning and loaded
by the default layout.

A postinstall hook on Bower (see `.bowerrc`) changes updates the paths in
`js/config.js` so that the optimizer can find the dependencies required by
any internal javascript modules (put these under `js/` and load them from
the main module, `js/app.js`).

To add a package, just run `bower install <name>`, add it to the dependency
array of the AMD definition where it is needed, and recompile.

## Testing

```bash
$ bundle exec nanoc check --all
```

## Deployment

Commit your changes and push them to [master](https://github.com/logankoester/landscapesforhealing/tree/master).

This will trigger a build at http://ci.ldk.io/logankoester/landscapesforhealing/. If the
`nanoc check --deploy` tests pass, the new build will be deployed to
[landscapesforhealing.com](http://landscapesforhealing.com) for you.

## Environment

The production environment runs on [Digital Ocean](https://www.digitalocean.com/),
and the domain is registered through [Hover](https://www.hover.com/).

## License

All content © 2007-2015 Landscapes For Healing.
