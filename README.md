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
ConsoleViewHelper.input 'username:'
ConsoleViewHelper.hidden_input 'password:'
```
- When **included**, call the methods directly
```ruby
banner('Gamecher', subtitle: 'play with style', indent: 1)
input 'username:'
hidden_input 'password:'
```
