CREATE EXTENSION fuzzystrmatch;

SELECT levenshtein ('oswaldo', 'osvaldo'); --data output: 1 -> indica que solo hay una letra de diferente entre los dos nombres

SELECT difference ('oswaldo', 'osvaldo'); --data output: 2 -> algo similar

SELECT difference ('beard', 'bird'); --data output: 4 -> muy similar