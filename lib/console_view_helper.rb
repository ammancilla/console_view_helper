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
  def explain(doing_txt, done_txt = '', n = 1, &block)
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
    n = opts[:indent] || 0
    symbol = opts[:symbol] || '*'
    subtitle = opts[:subtitle]
    base_width = (subtitle && subtitle.length > title.length ? subtitle.length : title.length) + 4
    width = opts[:width] || base_width
    raise ArgumentError.new("Specified width can't be minor thant #{base_width}. Increase or remove the width value.") if width < base_width
    banner = idt(n) + (symbol * (width + 2)) + nl
    banner << idt(n) + symbol + whites(width) + symbol + nl
    banner << idt(n) + symbol + align(title, width, :center) + symbol + nl
    banner << idt(n) + symbol + align(subtitle, width, :center) + symbol + nl if subtitle
    banner << idt(n) + symbol + whites(width) + symbol + nl
    banner << idt(n) + (symbol * (width + 2)) + nl
  end

  # Table
  def table(columns, opts = {})
    raise ArgumentError.new('Pass table columns as an array of arrays') unless columns.is_a?(Array) && columns.select { |item| !item.is_a?(Array) }.empty?
    # Set options
    n = opts[:indent] || 0
    cell_width = opts[:cell_width] || 12
    cell_separator = opts[:cell_separator] || bar
    cell_border = opts[:cell_border] || hyphen
    if opts[:header]
      opts[:header].each_with_index do |th, i|
        columns.push [] unless columns[i]
        columns[i].unshift(th)
      end
    end
    td_width = cell_width - 2
    tr_width = (cell_width * columns.length) + columns.length + 1
    
    # Build table
    pos, table = 0, ''
    begin
      tr_empty_elems = 0
      tr_str = idt(n) + (cell_border * tr_width) + nl + cell_separator
      columns.each do |column|
        td = if column[pos]
          column[pos]
        else
          tr_empty_elems += 1
          ''
        end
        td = align(td[0..td_width], cell_width, :center)
        tr_str << td + cell_separator 
      end
      tr_str << nl
      table << tr_str if tr_empty_elems != columns.length
      pos += 1
    end while tr_empty_elems != columns.length
    table << idt(n) + (cell_border * tr_width)
  end

  
  # List (unordered)
  def list(items, opts = {})
    raise ArgumentError.new('Pass list items in an array.') unless items.is_a? Array
    n = opts[:indent] || 0
    li_gap = opts[:li_gap] || 1
    symbol = opts[:symbol] || '•'
    list = idt(n)
    items.each_with_index do |li, i|
      symbol = opts[:ordered] ? "#{i + 1}." : symbol
      list << symbol + ' ' + li + nl(li_gap) + idt(n)
    end
    list
  end
  alias_method :ulist, :list

  # Ordered List
  def olist(items, opts = {})
    list items, opts.merge(ordered: true)
  end
  alias_method :menu, :olist

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
  module_function :idt, :astk, :nl, :hyphen, :underscore, :bar, :whites, :align, :printi, :putsi, :loading_effect, :explain, :colorize, :banner, :menu, :table, :list, :olist, :ulist, :input, :hidden_input
end
