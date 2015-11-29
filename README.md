# UPresenter

Simple Presenter for your Rails App.

## Why not use other gems?

All gems is good, but we just need to have a simple presenter layer without a lot of magic.
UPresenter - solve all our problem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'u_presenter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install u_presenter

## Usage

Let's create your first presenter for Article model.

  $ mkdir app/presenters/article_presenter.rb

And put this in your class:

```ruby
class ArticlePresenter < UPresenter::Base
  def id_humanize
    "Article id: #{object.id}"
  end
end
```

Now let's use this presenter:

```ruby
@article = ArticlePresenter.present(Article.last)

@article.id_humanize # your presenter method works fine
@article.created_at # and method from Model also works fine
```

## What about collection?

To present collection you can do this:

```ruby
@articles = ArticlePresenter.present_collection(current_user.articles)
@articles.presented.first.id_humanize # just use presented collection to show record
```

Why we use different method in this case? Just for simplicity. Because now, if you use Kaminari
pagination you can easy get access to all methods, without extra delegation setup:

```ruby
@articles.presented.each do |article|
  @article.id_humanize
end

@article.current_page
```

## Helpers in Presenter

To use helper methods inside Presenter you just need to add `view_context`:

```ruby
  @article = ArticlePresenter.present_collection(article, view_context)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/u_presenter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
