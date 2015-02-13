# rails_db_patch
Manage tool for one-time ruby script which executed to DB in Rails application.

[![Gem Version](https://badge.fury.io/rb/db_patch.svg)](http://badge.fury.io/rb/db_patch)

## Description

You write one-time script for manipulate db.
then you'll test it in your environment. if it is OK, now you execute it to production environment.

by the way, where the script should be commit to?
Surely the script was finished the role(rest in peace..)

but.

Any chance.
it the customer request you to create new environment?
if your colleague destroyed Database?

the script will called from hell to revive the environment.

and, you'll say "*I trashed that script!!!!*"

you'll think "*I wish I can also manage one-time script also like migration file.*"


### **This is it.**


## Usage

First after installed, you need to initialize database.
it creates 'patch_versions' table to DB.

```
rake db:patch:init
```

Craete new blank script file.

```
rake db:patch:new
```

and execute the script to DB.

```
rake db:patch:execute
```


if you want to clear add patch history. execute this command.

```
rake db:patch:clear
```


## Install

add Gemfile.

```Gemfile
gem "db_patch"
```

and install.

```
bundle install
```

then, It enable to use db_patch tasks.

```
$ rake -T
rake db:patch:clear                       # clear database
rake db:patch:execute                     # execute patch
rake db:patch:history                   	# show patch history
rake db:patch:init                        # initialize database
rake db:patch:new                         # create new patch file
```

## Contribution

## Licence

[MIT](https://github.com/jacoyutorius/rails_db_patch/blob/master/MIT-LICENSE)

## Author

[jacoyutroius](https://github.com/jacoyutorius)