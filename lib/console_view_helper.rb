# Encoding: utf-8

# Requires
require 'io/console'
require 'colored'

module ConsoleViewHelper

  #########################
  #        GENERAL        #
  #########################

  # Indent n times
  def idt(n = 1)
    "\t" * n
  end

  # Asterisk n times
  def astk(n = 1)
    '*' * n
  end

  # New n lines
  def nl(n = 1)
    "\n" * n
  end

  # Hyphen n times
  def hyphen(n = 1)
    '-' * n
  end

  # Underscore n times
  def underscore(n = 1)
    '_' * n
  end

  # Bar n times
  def bar(n = 1)
    '|' * n
  end

  # Whitespace n times
  def whites(n = 1)
    ' ' * n
  end

  # Align text
  def align(text, size, direction = :left, append = ' ')
    case direction
    when :right
      text.rjust(size, append)
    when :center
      text.center(size, append)
    else
      text.ljust(size, append)
    end
  end

  # 'print' text indented n times
  def printi(text, n = 1)
    print idt(n) + text
  end

  # 'put' text indented n times
  def putsi(text, n = 1)
    puts idt(n) + text
  end

  # Display a fake loading effect
  def loading_effect(n = 3, opts = {})
    delay = opts[:delay] || 0.3
    symbol = opts[:symbol] || '.'
    1.upto(n) do
      print symbol
      sleep delay
    end
    nil
  end

  # Explain the action being performed
  def explain(doing_txt, done_txt, n = 1, &block)
    printi doing_txt, n
    loading_effect
    result = block.call
    puts done_txt
    result
  end

  # Highlight text with color
  def colorize(text, status = :normal)
    case status
    when :success
      text.green
    when :error
      text.red
    when :warning
      text.yellow
    when :neutral
      text.blue
    else
      text.white
    end
  end

  #########################
  #       COMPONENTS      #
  #########################

  # Banner
  def banner(title, opts = {})
    subtitle = opts[:subtitle]
    base_width = (subtitle && subtitle.length > title.length ? subtitle.length : title.length) + 4
    width = opts[:width] || base_width
    n = opts[:indent] || 0
    banner = idt(n) + astk(width + 2) + nl
    banner << idt(n) + astk + whites(width) + astk + nl
    banner << idt(n) + astk + align(title, width, :center) + astk + nl
    banner << idt(n) + astk + align(subtitle, width, :center) + astk + nl if subtitle
    banner << idt(n) + astk + whites(width) + astk + nl
    banner << idt(n) + astk(width + 2) + nl
  end

  # User input
  def input(label = '>>', n = 0)
    printi label + whites, n
    gets.strip.chomp
  end

  # User input, but hidden
  def hidden_input(label = '>>', n = 0)
    printi label + whites, n
    STDIN.noecho(&:gets).strip.chomp
  end

  # --- 
  module_function :idt, :astk, :nl, :hyphen, :underscore, :whites, :align, :printi, :putsi, :loading_effect, :explain, :colorize, :banner, :input, :hidden_input
end


# -------------------------- CONSOLE VIEW HELPER ------------------------------
# - Helper methods to build simple and clean console application interfaces.

# --- HOW TO USE ---
# - Require and optionally include the module in your view file
# require 'cosole_view_helper'
# include ConsoleViewHelper

# - When just required call the methods from the module name
# ConsoleViewHelper.input 'username:'

# - When included call the methods directly
# input 'username:'

# --- WINDOW USERS ---
# - In order to use the 'colorize' method you will need the 'win32console' gem.

# - Get it:
# gem install 'win32console'

# - Require it:
# require 'win32console'