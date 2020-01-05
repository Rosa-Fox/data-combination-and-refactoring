# Data Combination

Combines data from the following files and outputs as either CSV or JSON:

* journals.csv: a list of journal titles and ISSNs;
* articles.csv: a list of article DOIs, titles and ISSNs;
* authors.json: a list of author names and their article DOIs.

## Requirements

* [Ruby](https://www.ruby-lang.org/en/documentation/installation/)

## Setup

Clone this repository and `cd` into the root directory of `01-problem`

### Get the dependencies

```
gem install bundler
```

```
bundle install
```

### Prerequisites

* There are 3 data files (journals.csv, articles.csv and authors.json) within the root of `01-problem`. These files are needed in order to produce the desired outcome.

### To generate a CSV file of the combined data:

From the root of `01-problem` run:

```
ruby combine.rb --format csv journals.csv articles.csv authors.json > full_articles.csv
```

### To generate a JSON file of the combined data:

```
ruby combine.rb --format json journals.csv articles.csv authors.json > full_articles.json
```

### To run the test suite

```
bundle exec rspec
```
