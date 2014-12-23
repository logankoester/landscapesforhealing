# Lea Hutchins

> The static site generator that runs [leahutchins.com](http://leahutchins.com)

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
$ git clone git@github.com:logankoester/leahutchins.git
$ cd leahutchins
$ bundle install
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
`created_at: YYYY-MM-DD`. This will add it to the [Atom feed](http://leahutchins.com/atom.xml),
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

## Testing

```bash
$ bundle exec nanoc check --all
```

## Deployment

Commit your changes and push them to [master](https://github.com/logankoester/leahutchins/tree/master).

This will trigger a build at http://ci.ldk.io/logankoester/leahutchins/. If the
`nanoc check --deploy` tests pass, the new build will be deployed to
[leahutchins.com](http://leahutchins.com) for you.

## Environment

The production environment runs on [Digital Ocean](https://www.digitalocean.com/),
and the domain is registered through [Hover](https://www.hover.com/).

## License

All content © 2007-2015 Lea Hutchins.
