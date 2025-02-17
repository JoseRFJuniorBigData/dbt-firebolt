# Changelog

## v.1.1.2

### Features

- dbt-firebolt now passes through more useful error messages on API timeouts.

### Under the hood

- dbt-firebolt now requires firebolt-sdk>=0.10.0.

## v.1.1.1

### Under the hood

- dbt-firebolt now requires firebolt-sdk>=0.9.2.

## v.1.1.0

### Features

- dbt-firebolt now supports the insert/overwrite incremental model.

### Under the hood

- dbt-firebolt now requires firebolt-sdk>=0.8.1.

### Breaking changes

- dbt-firebolt uses firebolt-sdk's new auth token method, thus requires firebolt-sdk >= 0.8.1.

## v.1.0.6

### Under the hood

- dbt-firebolt now requires dbt v1.1.
- dbt-firebolt now requires firebolt-sdk>=0.7.

### Breaking changes

- dbt-firebolt now requires dbt v1.1

## v.1.0.5

### Under the hood

- Added FireboltColumn class to handle string type.
- Added mypy to pre-commit tests.
- Fixed output from dbt runs so that successful table creation outputs “Success” rather than “False.”

## v.1.0.4

### Features

- dbt-firebolt now supports the append-only incremental model.
- We now return better/more accurate responses from the cursor for logging/debugging.

### Under the hood

- Rendering of SQL output was reformatted to increase legibility of debug output and log files.
- Removed all uses of `SHOW VIEWS` and `SHOW TABLES` and replaced them with calls to information_schema.views and information_schema.tables, respectively.
- Updated to give better/more accurate responses from cursor.
- Fixed an error where names for aggregating and join indexes with only single values for indexes were being improperly generated.

### Breaking changes

- Join and key column field names in aggregating and join indexes are now pluralized: `join_column` becomes `join_columns` and `key_column` becomes `key_columns` in index config blocks.

## v.1.0.3

### Under the hood

- Dev requirements are now in setup.cfg and not dev-requirements.txt.
- dbt-firebolt now requires firebolt-sdk v.0.6 to allow for SET variables to be set in pre-hooks.

## v.1.0.2

### Features

- dbt-firebolt now supports aggregating indexes with multiple-column keys.

### Under the hood

- Bug fix to check for `data_type` and `regex` fields when necessary on external tables.
- Changed default behavior on external table insert to `DROP IF EXISTS`.

### Breaking changes

- Models with aggregating and join indexes now require `index_type` field in index config blocks rather than `type`.

## v.1.0.1

### Under the hood

- Updated seed behavior. Seed now does a `DROP <table_name> CASCADE` followed by a `CREATE TABLE <table_name>` rather than `TRUNCATE`, which was not working consistently.

## v.1.0.0

- dbt-firebolt now supports dbt 1.0+!

## v.0.21.10

### Breaking changes

- We now use our [DB-API](https://github.com/firebolt-db/firebolt-python-sdk) rather than our JDBC.

## v.0.21.9

### Under the hood

- Bug fixes to do with pull request linting.
– Also for PRs, moved to conventional commmits.

## v.0.21.8

### Under the hood

- Updated pre-commit linting and added pull request linting.

## v.0.21.7

### Changes

- Disallowed setting of `threads` in `profiles.yml` to a value greater than 1.

### Under the hood

- Added automatic PR security scanning via Sonar Cloud adn Fossa.

## v.0.21.6

### Changes

- Updated readme to link to Firebolt JDBC page, in order to assure latest driver is always linked.

## v.0.21.5

### Under the hood

- Resolved unknown import error.

## v.0.21.4

### Changes

- Views are now officially supported with dbt-firebolt! [#22](https://github.com/firebolt-db/dbt-firebolt/pull/22) and [#25](https://github.com/firebolt-db/dbt-firebolt/pull/25).

### Under the hood

- Added GitHub templates for PRs and issues.
- Added linting using Black, Flake8, and iSort. This necessitated the addition of a `setup.cfg` file, so an additional linter, `setup-cfg-fmt` was added to check that file. These linters are all pre-commit hooks, so will force any future commits to abide by our style. [#20](https://github.com/firebolt-db/dbt-firebolt/pull/20).
- Indefinitely removed `setup.cfg` from project [#29](https://github.com/firebolt-db/dbt-firebolt/pull/29).

## v.0.21.3

### Changes

- Temporary workaround implemented for #11 where running models twice fails [#12](https://github.com/firebolt-db/dbt-firebolt/pull/12).

## v.0.21.2

### Readme

- Updated and edited various sections of readme, adding new tables and examples for clarity. [#6](https://github.com/firebolt-db/dbt-firebolt/pull/6).

### Breaking Changes

- `engine_name` has been renamed to `engine` please update your `profiles.yml` accordingly [#4](https://github.com/firebolt-db/dbt-firebolt/pull/4).

### Features

- Added ability to specify an account for users who have more than one account associated with their credentials [#4](https://github.com/firebolt-db/dbt-firebolt/pull/4).

### Fixes

- Fixed bug where database connection URL used backslashes on Windows due to `os.path.join` [#5](https://github.com/firebolt-db/dbt-firebolt/pull/5).


## v.0.21.1

### Fixes

- Removed log statements and an extra `firebolt__get_create_index_sql` macro error via [#2](https://github.com/firebolt-db/dbt-firebolt/pull/2).

- Added ability to specify an account for users who have more than one account associated with their credentials.

## v.0.21.0

### Features

- Initial release for PyPI!

### Fixes

- Many

### Under the Hood

- A lot of work!

### Contributors

- [@ima-hima](https://github.com/ima-hima) and [@swanderz](https://github.com/swanderz)
