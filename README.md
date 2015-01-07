console_view_helper
===================

Set of methods and components I use commonly when building console application interfaces

# Installation
Run from your command line:
```
$ gem install 'console_view_helper'
```
Then, require it on your view file:
```ruby
require 'console_view_helper'
```
And **optionally** include it too:
```ruby
include ConsoleViewHelper
```

# Usage
- When **just required**, call the methods from the module name
```ruby
ConsoleViewHelper.banner('Gamecher', subtitle: 'play with style', indent: 1)
username = ConsoleViewHelper.input('username:')
password = ConsoleViewHelper.hidden_input('password:')
```
- When **included**, call the methods directly
```ruby
banner('Gamecher', subtitle: 'play with style', indent: 1)
username = input('username:')
password = hidden_input('password:')
```

# Window Users
In order to use the `colorize` method you will need the `win32console` gem.

Get it:
```ruby
gem install 'win32console'
```
Then require it:
```ruby
require 'win32console'
```
