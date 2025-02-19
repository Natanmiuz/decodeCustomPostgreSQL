# Function `decode_custom`  in PostgreSQL

This repository contains a custom PostgreSQL function called `decode_custom`, which emulates the behavior of the `DECODE` function in Oracle. This function allows performing comparisons and returning specific values based on those comparisons.

## Description

The `decode_custom` function takes two parameters:

- `input_value`: the input value that will be compared with the comparison values defined in the `args` array.
- `args`: an array of values in pairs (comparison value and return value). The number of elements in `args` must be even.

The function checks if the `input_value` matches any of the comparison values in `args`. If a match is found, it returns the corresponding value; otherwise, it returns the `input_value` without any modifications.

### Input Validation

- The function validates that the number of elements in `args` is even. If not, it will raise an exception with the message: `The number of arguments must be even`.

## Example Usage

If you have a table called `employees` with a column `status`, and you want to use the `decode_custom` function to return human-readable values instead of codes, the usage would be as follows:

```sql
SELECT decode_custom(status, 'A', 'Active', 'I', 'Inactive', 'S', 'Suspended')
FROM employees;
