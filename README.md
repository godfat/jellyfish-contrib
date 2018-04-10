# jellyfish-contrib [![Build Status](https://secure.travis-ci.org/godfat/jellyfish-contrib.png?branch=master)](http://travis-ci.org/godfat/jellyfish-contrib) [![Coverage Status](https://coveralls.io/repos/godfat/jellyfish-contrib/badge.png)](https://coveralls.io/r/godfat/jellyfish-contrib) [![Join the chat at https://gitter.im/godfat/jellyfish-contrib](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/godfat/jellyfish-contrib)

by Lin Jen-Shin ([godfat](http://godfat.org))

## LINKS:

* [github](https://github.com/godfat/jellyfish-contrib)
* [rubygems](https://rubygems.org/gems/jellyfish-contrib)
* [rdoc](http://rdoc.info/github/godfat/jellyfish-contrib)

## DESCRIPTION:

Extra [Jellyfish](https://github.com/godfat/jellyfish) extensions.

## FEATURES:

* Jellyfish::MultiActions
* Jellyfish::NewRelic
* Jellyfish::Sinatra
* Jellyfish::Swagger

## REQUIREMENTS:

* Tested with MRI (official CRuby), Rubinius and JRuby.

## INSTALLATION:

    gem install jellyfish-contrib

## SYNOPSIS:

You could also take a look at [config.ru](config.ru) as an example, which
also uses [Swagger](https://helloreverb.com/developers/swagger) to generate
API documentation.

### Using multiple extensions with custom controller

This is effectively the same as using Jellyfish::Sinatra extension.
Note that the controller should be assigned lastly in order to include
modules remembered in controller_include.

``` ruby
require 'jellyfish-contrib'
class Tank
  include Jellyfish
  class MyController < Jellyfish::Controller
    include Jellyfish::MultiActions
  end
  controller_include NormalizedParams, NormalizedPath
  controller MyController

  get do # wildcard before filter
    @state = 'jumps'
  end
  get %r{^/(?<id>\d+)$} do
    "Jelly ##{params[:id]} #{@state}.\n"
  end
end
use Rack::ContentLength
use Rack::ContentType, 'text/plain'
run Tank.new
```

<!---
GET /123
[200,
 {'Content-Length' => '18', 'Content-Type' => 'text/plain'},
 ["Jelly #123 jumps.\n"]]
-->

### Extension: MultiActions (Filters)

``` ruby
require 'jellyfish-contrib'
class Tank
  include Jellyfish
  controller_include Jellyfish::MultiActions

  get do # wildcard before filter
    @state = 'jumps'
  end
  get do
    "Jelly #{@state}.\n"
  end
end
use Rack::ContentLength
use Rack::ContentType, 'text/plain'
run Tank.new
```

<!---
GET /123
[200,
 {'Content-Length' => '13', 'Content-Type' => 'text/plain'},
 ["Jelly jumps.\n"]]
-->

### Halt in before action

``` ruby
require 'jellyfish-contrib'
class Tank
  include Jellyfish
  controller_include Jellyfish::MultiActions

  get do # wildcard before filter
    body "Done!\n"
    halt
  end
  get '/' do
    "Never reach.\n"
  end
end

use Rack::ContentLength
use Rack::ContentType, 'text/plain'
run Tank.new
```

<!---
GET /status
[200,
 {'Content-Length' => '6', 'Content-Type' => 'text/plain'},
 ["Done!\n"]]
-->

### Extension: NewRelic

``` ruby
require 'jellyfish'
class Tank
  include Jellyfish
  controller_include Jellyfish::NewRelic

  get '/' do
    "OK\n"
  end
end
use Rack::ContentLength
use Rack::ContentType, 'text/plain'
require 'cgi' # newrelic dev mode needs this and it won't require it itself
require 'new_relic/rack/developer_mode'
use NewRelic::Rack::DeveloperMode # GET /newrelic to read stats
run Tank.new
NewRelic::Agent.manual_start(:developer_mode => true)
```

<!---
GET /
[200,
 {'Content-Length' => '3', 'Content-Type' => 'text/plain'},
 ["OK\n"]]
-->

### Extension: Sinatra flavoured controller

It's an extension collection contains:

* MultiActions
* NormalizedParams
* NormalizedPath

``` ruby
require 'jellyfish-contrib'
class Tank
  include Jellyfish
  controller_include Jellyfish::Sinatra

  get do # wildcard before filter
    @state = 'jumps'
  end
  get %r{^/(?<id>\d+)$} do
    "Jelly ##{params[:id]} #{@state}.\n"
  end
end
use Rack::ContentLength
use Rack::ContentType, 'text/plain'
run Tank.new
```

<!---
GET /123
[200,
 {'Content-Length' => '18', 'Content-Type' => 'text/plain'},
 ["Jelly #123 jumps.\n"]]
-->

### Extension: Swagger API documentation

For a complete example, checkout [config.ru](config.ru).

``` ruby
require 'jellyfish-contrib'
class Tank
  include Jellyfish
  get %r{^/(?<id>\d+)$}, :notes => 'This is an API note' do |match|
    "Jelly ##{match[:id]}\n"
  end
end
use Rack::ContentLength
use Rack::ContentType, 'text/plain'
map '/swagger' do
  run Jellyfish::Swagger.new('', Tank)
end
run Tank.new
```

<!---
GET /swagger
[200,
 {'Content-Type'   => 'application/json; charset=utf-8',
  'Content-Length' => '81'},
 ['{"swaggerVersion":"1.2","info":{},"apiVersion":"0.1.0","apis":[{"path":"/{id}"}]}']]
-->

## CONTRIBUTORS:

* Fumin (@fumin)
* Lin Jen-Shin (@godfat)

## LICENSE:

Apache License 2.0

Copyright (c) 2012-2018, Lin Jen-Shin (godfat)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
