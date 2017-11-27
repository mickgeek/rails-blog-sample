# Rails Blog Sample

This repository contains a simple web application built with the Ruby on Rails web framework.

The project has the next base features:
- Blog (with draft/publish/archive management of posts and tag filtering)
- Single pages
- Feedback page

## Setting Up a Development Environment

1. Create a Ruby 2.4.1 environment (e.g. via [rbenv](https://github.com/rbenv/rbenv) or [RVM](https://github.com/rvm/rvm)).
2. Install required dependencies:
```bash
bundle install --binstubs
```
3. Create a role with the `123456` password for PostgreSQL databases:
```bash
su - postgres
createuser -P -d railsblogsample
exit
```
4. Create a database with schema and add initial data:
```bash
bin/rails db:setup
```
5. Run the local server:
```bash
bin/rails server
```

Done! :tada: Use `admin@example.com` as the user email and `123456` as the password to log in to the admin panel.
