# CPP project template 

This templates intends to give an Hemingway bridge to your cpp project and directly dive into your project without losing time in configuration and repetitive tasks that usually slows me down and burn down my energy and motivation while I should spend it on my project

## Table of Contents

- [Cpp project template](#cpp-project-template)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Features](#features)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the Tests](#running-the-tests)

## Description

The template is composed of a CMakeList that compiles sources files in the 'src' folders and another sub CMakeList that compiles test in the test folder. Tests are using the [Catch2](https://github.com/catchorg/Catch2) test framework. Furthermore, the template add automatic formatting and a [pre-commit](https://github.com/pocc/pre-commit-hooks) configuration for cpp projects (including clang-format, clang-tidy, etc). The template also facilates the use of doxygen for the documentation.

## Features

- Unit test framework
- Formatting tool
- Pre-commit hooks
- Doxygen documentation

## Prerequisites

List the software and libraries you need to have installed before you can run this project.

- C++ compiler (e.g., GCC, Clang)
- CMake (version 3.5 or higher)
- [pre-commit](https://pre-commit.com/#install)
- clang-format
- clang-tidy
- include-what-you-use

## Installation

Install pre-commits hooks with the command :
`pre-commit autoupdate && pre-commit install`

## Running the Tests

To compile the unit tests of the template repository, you can use the following cmake command:
```bash
# Inside the build directory
make test
```

or to run the tests directly you can either use `make runtests` or `make verboseruntests`
