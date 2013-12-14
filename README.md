XMLParser
=========

This is a XML Parser that will parse Aesop's Absence XML data and insert it into any SQL database according to the sequel gem (https://github.com/jeremyevans/sequel)

Version
----

1.0

Tech
-----------

Dillinger uses a number of open source projects to work properly:

* [Ruby] - awesome web-based text editor
* [Sequel Gem] - a super fast port of Markdown to JavaScript
* [NokoGiri] - great UI boilerplate for modern web apps

Installation
--------------

```sh
$ ruby parser.rb
.
.
$ sqlite3 absencedb [or whatever you want to name the database file here.  Change like 49 if necessary]
$ SELECT * FROM absencedata [whatever table name]
```

Note
----

You may change the passing variables in lines 49, 52, 55, and 58 to whatever names or file you'd like.

For example:

```ruby
#creates the database file after each new instance
absence = Absence.new("choose DB Name")

#parses for AesopAbsences.xml or any file
parse = absence.parse('Choose XML fil')

#creates table within the database
absence.create_table(:choose_table_name)

#inserts table with data in the database
absence.insert_table(:choose_table_name, parse)
```