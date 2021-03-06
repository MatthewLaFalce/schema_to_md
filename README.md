<h1 align="center">Welcome to Schema_to_md 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-v1.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/MatthewLaFalce/schema_to_md/blob/master/README.md">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" target="_blank" />
  </a>
  <a href="https://github.com/MatthewLaFalce/schema_to_md/blob/master/LICENSE">
    <img alt="License: license" src="https://img.shields.io/badge/License-license-yellow.svg" target="_blank" />
  </a>
</p>

> Generate beautiful markdown documentation for your PostgreSQL Database from schema.rb files.

### 🏠 [Homepage](https://github.com/MatthewLaFalce/schema_to_md)

## Install

```bash
git clone git@github.com:MatthewLaFalce/schema_to_md.git
export PATH=$PATH:~/Github/schema_to_md
# then follow Rails ERD installation below
```

## Usage

```bash
# Run this command at the head of any Rails Web App
to_md
```

## Rails ERD

```bash
# Requires download of Graphviz
brew install graphviz       # Homebrew on Mac OS X
sudo port install graphviz  # Macports on Mac OS X
sudo apt install graphviz   # Debian and Ubuntu

#put this in projects gem file

group :development do
  gem 'rails-erd'
end

# Then run
bundle install

# Generate simple erd
rake erd filetype='png' notation=bachman filename='erd_simple'

# Generate complex erd
rake erd polymorphism=true filetype='png' notation=bachman filename='erd_complex'

# Most Useful
bundle exec rake erd polymorphism=true filetype='png' notation=bachman filename='erd' exclude='ApplicationRecord,Record,Searchable,PgSearch::Document,ActiveStorage::Attachment,ActiveStorage::Blob'
```

## Automated Rails ERD Setup

```yml
# Put this in your projects .erdconfig file
#!/bin/yml

filename: 'erd'
filetype: 'png'
notation: 'bachman'
polymorphism: true
title: 'Docupiler ER Diagram'
exclude: 'ApplicationRecord,Record,Searchable,PgSearch::Document,ActiveStorage::Attachment,ActiveStorage::Blob,ActiveRecord::InternalMetadata,ActiveRecord::SchemaMigration'
```

```ruby
# Put this in your projects Gemfile
group :development do
  gem 'rails-erd'
end

# Put this in your project Rakefile if you uses :sql for your schema format
Rake::Task["db:migrate"].enhance do
  if ActiveRecord::Base.schema_format == :sql
    Rake::Task["db:schema:dump"].invoke
  end
end

# Run this to install the Gem to your project
bundle install

# Run this to set up the Rake task to work with db:migrate
bundle exec rails g erd:install

# To generate your new diagram just run
bundle exec rails db:migrate
```

## Author

👤 **Matthew LaFalce**

* Github: [@MatthewLaFalce](https://github.com/MatthewLaFalce)

## Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/MatthewLaFalce/schema_to_md/issues).

## Show your support

Give a ⭐️ if this project helped you!

## License

Copyright © 2019 [Matthew LaFalce](https://github.com/MatthewLaFalce).<br />
This project is [MIT](https://github.com/MatthewLaFalce/schema_to_md/blob/master/LICENSE) licensed.

