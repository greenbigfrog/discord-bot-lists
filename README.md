# discord-bot-lists

Helps posting stats to multiple bot list pages. Currently supports bots.gg and DBL

## Installation

1. Add the dependency to your `shard.yml`:
```yaml
dependencies:
  discord-bot-lists:
    github: greenbigfrog/discord-bot-lists
```
2. Run `shards install`

## Usage

```crystal
require "discord-bot-lists"
include Dbl
post_stats(
  {"discordbots.org" => "ey89ttUHiftw",
   "discord.bots.gg" => "eyJhbGciOiJW__Ms"},
   10
)
sleep

```

## Contributing

1. Fork it (<https://github.com/greenbigfrog/discord-bot-lists/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Jonathan B.](https://github.com/greenbigfrog) - creator and maintainer
