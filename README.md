#SurveyApp

##Environment setup:

Create a `database.yml` by copying it from example:

```shell
cp config/database.yml.example config/database.yml
```

Installing gems:
```shell
bundle
```

Initialize database scheme and initial data using:
```shell
bundle exec rake db:setup
```

This will create a test user:
```shell
user@test.com / password
```

Initial requirements can be found in REQUIREMNETS.md
