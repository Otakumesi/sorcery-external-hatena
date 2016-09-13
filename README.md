# Sorcery::External::Hatena
The OAuth provider of Japanese famous social community """Hatena""" add to external of sorcery as the Rails's auth gem

## Usage

With the assumption, you are using [sorcery](https://github.com/NoamB/sorcery).

After this gem install in Rails Application:

```bash
$ rails g hatena:install
```
next...

This in an example that you might put into Rails initializers at ```config/initializers/sorcery.rb```.

```ruby
Rails.application.config.sorcery.configure do |config|

config.external_providers = [:twitter, :github, :hatena] # Add :hatena

# ... other provider code ...

# add following code

#
# Hatena OAuth Provider
# the following code is a example.
# customize in accordance with the your environment.
#
config.hatena.key = ENV['HATENA_KEY']
config.hatena.secret = ENV['HATENA_SECRET']
config.hatena.callback_url = "http://127.0.0.1:3000/oauth/callback?provider=hatena"
config.hatena.user_info_mapping = {user_name: "display_name", image_url: "profile_image_url"}'
config.hatena.scope = "read_public"

# ... other provider code ...

end
```

## MoreInfometion
[Hatena's API doc](https://github.com/Otakumesi/sorcery-external-hatena.git) (only japanese)  
[Sorcery's GithubPage](https://github.com/NoamB/sorcery)  
[Sorcery::External's doc](https://github.com/NoamB/sorcery/wiki/External)  


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sorcery-external-hatena', github: 'Otakumesi/sorcery-external-hatena'
```
And then execute:
```bash
$ bundle install
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
