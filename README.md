## HUBLINGO ##

A fun project to retrieve the favourite languages of Github users.

Use inside your favourite Rails/Sinatra/Rack application.

The gem uses your Github application id and secret to retrieve data: in
this scenario they should be stored in environment variables. In the Rails
app that uses this gem this is managed by dotenv.

You can also use the gem in irb/pry as follows:

```ruby
require 'hublingo'
hub = Hublingo.new
hub.lingo('buddhamagnet')
```

NOTES:

This whole project, the gem and [application](https://github.com/buddhamagnet/hackertongue), was completed in 3 1/2 hours.

I published it as a gem for giggles only.

[![Gem Version](https://badge.fury.io/rb/hublingo.png)](http://badge.fury.io/rb/hublingo)