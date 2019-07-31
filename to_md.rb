#!/usr/bin/ruby

DB_SCHEMA = ARGV[0]
file = File.open('db_schema.md', 'w')

file.puts "# Database Schema"
file.puts "> This is a complete guide of the database structure"
file.puts ""
file.puts "## Table Descriptions"
file.puts ""

def remove_unwanted_characters(param)
  param.gsub(',','').gsub('"','')
end

def to_human_uppercase(param)
  param = param.split(' ')[1]
  parts = remove_unwanted_characters(param).gsub('_',' ').split(' ')
  uppercase_parts = Array.new
  parts.each do |part|
    uppercase_parts.push part.capitalize
  end
  uppercase_parts.join(' ')
end

def attribute_parts(params)
  name = nil
  value = nil
  default = '~'
  allow_null = '~'

  parts = params.split(' ')

  name = remove_unwanted_characters(parts[1])
  value = parts.first.gsub('t.','')

  if params.include? 'default: '
    index = parts.index('default:') + 1
    default = "`#{parts[index].gsub(',','').strip}`"
  end

  if params.include? 'null: '
    index = parts.index('null:') + 1
    allow_null = "`#{parts[index].gsub(',','').strip}`"
  end

  {
    name: name,
    value: value,
    default: default,
    allow_null: allow_null
  }
end

File.open( DB_SCHEMA ).each do |line|
  line = line.strip()
  unless line.start_with? '#'
    if line.include? 'create_table'
      file.puts ""
      file.puts "### #{to_human_uppercase(line)}"
      file.puts "| Name | Value | Default | Allow Null? | Description |"
      file.puts "| --- | ---| --- | --- | --- |"
    elsif line.start_with? 't.'
      unless line.include? 't.index'
        parts = attribute_parts(line)
        file.puts "| #{parts[:name]} | #{parts[:value]} | #{parts[:default]} | #{parts[:allow_null]} |"
      end
    end
  end
end
