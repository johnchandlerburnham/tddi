---
title: "(TDDI 01/15): Overview"
author: jcb
date: 2018-08-03
tags: tddi, notes, idris
---

# Preface

- Software is unreliable
- Types constrain the behaviour of software
- Dependent types constrain software based on the concrete values the program
  operates on.
- Constrained software is software that has less space to fail.

## Acknowledgments

Related technologies to Idris: Haskell, Epigram, Agda, Coq

## About this book

- Part 1 (Chapters 01-02) introduces concepts and gives a tour of Idris
- Part 2 (Chapters 03-10) introduces the core language features
- Part 3 (Chapters 11-15) describes some applications of Idris

# Part 1: Introduction

- Two most distinctive parts of Idris are *typed-holes*, which let you
  investigate what the types should be for parts of the program that haven't
  been written yet, and *first-class type*, which is being able to manipulate
  types in your code in the same way you can manipulate values.

## Installing Idris on NixOS

```
Λ → nix-env -iA nixos.idris
Λ → idris
```

Using vim extension: [`idris-hackers/idris-vim`](https://vimawesome.com/plugin/idris-vim)

# Chapter 1: Overview

## 1.1 What is a type?

Types are to values as shapes are to objects. In other words, types are like
*forms* in the Aristotelean sense.

## 1.2 Introducting type-driven development

Types also function as compiler-checked documentation.

Some examples of applications for which types are useful:

### 1.2.1 Matrix arithmetic

Dependent types are types that depend on values. `Matrix 3 2` depends on the
values `3` and `2`.

### 1.2.2 An atm

Types can guarantee that the implementation of a state machine (an example of
which is an atm) matches its specification (as encoded by its type).

### 1.2.3 Concurrent programming

Defining the interaction between multiple processes is like the defining the
interaction between multiple state machines (which is just one big state
machine).

### 1.2.5 Dependent Types

- A simple type is a type-constant.
- A generic type is a type constructor: `Type -> Type`
- A dependent type is a type constructor: `Value -> Type`

### Introductory exercises

1. identity function
2. append a vector to itself
3. remove an element from a vector
4. index a vector


## 1.4 A quick tour of Idris

### 1.4.3 Compiling and running Idris programs

see `01/Hello.idr`


### 1.4.4 Incomplete definitions: working with holes

see `01/Holes.idr`

see `01/TypeError.idr`
see `01/TypeCast.idr`

see `01/FCTypes.idr`

```idris
valToString : (x : Bool) -> StringOrInt x -> String
valToString x val = case x of
                        True => cast val
                        False => val
```

The type-level function `StringOrInt` is interesting, because it acts a little
like an implicit `Either Int String`. That is, in this case we can kind-of
replace a type level function in a signature with the type of the functions
range.

In haskell:

```haskell
valToString :: Bool -> (Either String Int) -> String
valToString x val = case (x, val) of
  (True, Right n) -> show n
  (False, Left str) -> str
  _ -> error "bad combination"
```

But if we do this, our function is partial! The Idris function `StringOrInt`
moves our logic that we only want pairs of `(True, Int)` and `(False, String)`
to the type-level, meaning that `valToString` will now throw a compile time
error if it gets called with a combination we don't want, rather than error at
runtime.

Very cool!
