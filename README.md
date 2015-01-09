# console_view_helper (0.0.3)

The console_view_helper library is used to build clean and beautiful console application interfaces.
Customizable Components such as **banners**, **tables**, **menus**, **lists**, **text inputs**, **hidden text inputs** and methods as **colorize**,  **putsi**, **printi**, **align**, **explain**, among others, will help you build a good console application interface with **less code** and in **less time**.

## Installation

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

## Usage

- When **just required**, call the methods from the module name:
```ruby
ConsoleViewHelper.banner('Gamecher', subtitle: 'play with style', indent: 1)
username = ConsoleViewHelper.input('username:')
password = ConsoleViewHelper.hidden_input('password:')
```
- When **included**, call the methods directly:
```ruby
banner('Gamecher', subtitle: 'play with style', indent: 1)
username = input('username:')
password = hidden_input('password:')
```
## Components
Below is the list of components included:

### banner
```
****************************************************
*                                                  *
*                     Gamecher                     *
*                 Play with style                  *
*                                                  *
****************************************************
```
```ruby
# Usage
ConsoleViewHelper.banner(title, opts = {}) # Defaults: { subtitle: nil, symbol: '*', width: nil,  indent: 0 }

# Previous example:
puts ConsoleViewHelper.banner('Gamecher', subtitle: 'Play with style' , symbol: '*', width: 50)
```

### table
```
----------------------------------------------------------------------------
|      ID      |     NAME     |   LASTNAME   |     AGE      |   ADDRESS    |
----------------------------------------------------------------------------
|      1       |   Alfonso    |   Mancilla   |      22      |              |
----------------------------------------------------------------------------
|      2       |    Nestor    |    Turizo    |              |              |
----------------------------------------------------------------------------
|      3       |  Guillermo   |   Iguaran    |              |              |
----------------------------------------------------------------------------
|      4       |    Danilo    |              |      25      |              |
----------------------------------------------------------------------------
```
```ruby
# Usage
ConsoleViewHelper.table(columns, opts = {}) # Defaults: { header: [], cell_width: 12, cell_separator: '|', cell_border: '-'  indent: 0 }

# Previous example:
puts ConsoleViewHelper.table([%w(1 2 3 4), %w(Alfonso Nestor Guillermo Danilo), %w(Mancilla Turizo Iguaran), ['22', '', '', '25']], header: %w(ID NAME LASTNAME AGE ADDRESS), cell_width: 14)
```

### menu
```
1. Register

2. Login

3. Exit
```
```ruby
# Usage
ConsoleViewHelper.menu(items, opts = {}) # Defaults: { li_gap: 1, symbol: '•',  indent: 0 }

# Previous example
puts ConsoleViewHelper.menu(%w(Register Login Exit), li_gap: 2)
```

### lists
- **Ordered**
```
1. first
2. second
3. third
```
```ruby
# Usage
ConsoleViewHelper.olist(items, opts = {}) # Defaults: { li_gap: 1, symbol: '•',  indent: 0 }

# Previous example:
puts ConsoleViewHelper.olist(%w(first second third))
```
- **Unordered**
```
• black
• yellow
• white
```
```ruby
# Usage
ConsoleViewHelper.ulist(items, opts = {}) # Defaults: { li_gap: 1, symbol: '•',  indent: 0 }

# Previous example
puts ConsoleViewHelper.ulist(%w(black yellow white))
```

### inputs
- **Text input**
```ruby
ConsoleViewHelper.input(label = '>>', indent = 0)
```
- **Hidden text input** (Typed text will not be visible)
```ruby
ConsoleViewHelper.hidden_input(label = '>>', indent = 0)
```

## Helper Methods
Description will be here soon...

## Window Users
In order to use the `colorize` method you will need the `win32console` gem.

Get it:
```ruby
gem install 'win32console'
```
Then require it:
```ruby
require 'win32console'
```
