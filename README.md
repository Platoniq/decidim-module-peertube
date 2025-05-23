# Decidim::Peertube

[![Coverage Status](https://coveralls.io/repos/github/Platoniq/decidim-module-peertube/badge.svg?branch=main)](https://coveralls.io/github/Platoniq/decidim-module-peertube?branch=main)

Peertube implementation for Decidim.

## Usage

Peertube will be available as a Component for a Participatory
Space.

Through this Component you will be able to embed a Peertube video.

![admin_embed_peertube_video.png](examples%2Fadmin_embed_peertube_video.png)

![preview_peertube_component.png](examples%2Fpreview_peertube_component.png)

You can also link a Peertube instance account to your Decidim user. This would allow you to start live stream videos.

To enable this functionality you have to follow these steps:

1. Retrieve a client id and secret from your instance.

   You can request it using a terminal, as shown at [PeerTube REST API quick start](https://docs.joinpeertube.org/api-rest-reference.html#tag/Session/operation/getOAuthClient).

   ```bash
   API="https://instance-host/api/v1"

   ## AUTH
   curl -s "$API/oauth-clients/local"
   ```
2. Configure the following environment variables for the module.
   
   **PEERTUBE_HOST**: Host of your Peertube instance.

   **PEERTUBE_CLIENT_ID**: Client id obtained on previous step.

   **PEERTUBE_CLIENT_SECRET**: Client secret obtained on previous step.

3. Go to the component and click on Link Peertube Account. Login with an account from the Peertube instance configured, using email and password.

![peertube_login.png](examples%2Fpeertube_login.png)

Then you should be able to see your Peertube account information.

![admin_peertube.png](examples%2Fadmin_peertube.png)

And to create a live video.

![live_video.png](examples%2Flive_video.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "decidim-peertube"
```

And then execute:

```bash
bundle
bundle exec rake decidim_peertube:install:migrations
bundle exec rake db:migrate
```

## Contributing

See [Decidim](https://github.com/decidim/decidim).

Developing
To start contributing to this project, first:

Install the basic dependencies (such as Ruby and PostgreSQL)
Clone this repository
Decidim's main repository also provides a Docker configuration file if you prefer to use Docker instead of installing the dependencies locally on your machine.

You can create the development app by running the following commands after cloning this project:

```bash
$ bundle
$ DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rake development_app
```

Note that the database user has to have rights to create and drop a database in order to create the dummy test app database.

Then to test how the module works in Decidim, start the development server:


```bash
$ cd development_app
$ DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rails s
```

Code Styling
Please follow the code styling defined by the different linters that ensure we are all talking with the same language collaborating on the same project. This project is set to follow the same rules that Decidim itself follows.

Rubocop linter is used for the Ruby language.

You can run the code styling checks by running the following commands from the console:

```bash
$ bundle exec rubocop
To ease up following the style guide, you should install the plugin to your favorite editor, such as:
```

Atom - linter-rubocop
Sublime Text - Sublime RuboCop
Visual Studio Code - Rubocop for Visual Studio Code
Testing
To run the tests run the following in the gem development path:

```bash
$ bundle
$ DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rake test_app
$ DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rspec
```

Note that the database user has to have rights to create and drop a database in order to create the dummy test app database.

In case you are using rbenv and have the rbenv-vars plugin installed for it, you can add these environment variables to the root directory of the project in a file named .rbenv-vars. In this case, you can omit defining these in the commands shown above.

## License

This engine is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.
