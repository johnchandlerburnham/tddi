---
title: "(TDDI 02/15): Getting started with Idris"
author: jcb
date: 2018-10/30
tags: tddi, notes, idris
---

- Idris, unlike Haskell is not lazy by default.

see `02/Average.idr`

# 2.1 Basic types

## 2.1.1 Numeric types and values

- `Int`: fixed-width signed integer
- `Integer`: unbounded signed integer
- `Nat`: unbounded unsigned integer
- `Double`: double-precision floating-point

Declare variables in REPL with `:let`

```idris
> :let x = 2
> x
2 : Nat
```

Explicit types with the `the` function:

```idris
> :let x = the Int 2
> x
2 : Int
> :t the
the : (a : Type) -> a -> a
```

In other words, `the` takes a `Type` and a value of that type. Why does this do
anything? Because for values that can be of multiple types, `the` lets us tell
Idris to infer the type we actually want.

## 2.1.2 Type conversions using cast

I think `cast` is done with type classes:

```idris
> :t cast
cast : Cast from to => from -> to
```

# 2.2 Functions: the building blocks of Idris programs


### 2.2.21 Function types and definitions

see `Double.idr`

It seems very sensible to me that Idris requires explicit type declaration.  In
Haskell, explicit type declarations are required only by social convention; it
seems wiser to have convention be encoded in the compiler.

## 2.2.2 Partially applying functions

Currying. Idris has it.

## 2.2.3 Writing generic functions: variables in types

Parametric polymorphism, Idris has it? I don't know whether Idris uses the same
`forall` style quantification or something different.

## 2.2.4 Writing generic functions with constrained types

So this is the same thing Haskell uses typeclasses for, but Idris calls them
constraints.

see `02/Generic.idr`

The sectioning of infix operators can result in this amusing argument flipping:

```idris
> (< 3) 4
False : Bool
> ((<) 3) 4
True : Bool
```

# 2.3 Composite types

## 2.3.1 Tuples

It's interesting that tuples are defined as nested pairs. It makes sense, an
I'm guessing this is what allows arbitrary tuple nesting as compared to Haskell,
where tuples are manually defined in Prelude up to n=20 (or some such number)
and after that you're on your own.

## 2.3.2 Lists

Also interesting how Idris preserves Haskell's syntax for list values, but goes
with explicit `List` syntax for the type. I like this, it makes the list type
consistent with other types like `Set` or `Vect`, which don't have special type
syntax either.

Nice that we have ranges here too.

## 2.3.3 Functions with lists

Very nice that `fmap` from Haskell is just `map` here.

I wonder if there's a way to parameterize the `length` functions (for `List`,
`String`, `Vect` etc.) over some constraint. I'm assuming there's a `Foldable`
constraint somewhere here?

# 2.4 A complete Idris program

## 2.4.1 Whitespace significance: the layout rule

Whitespace rules seems basically the same as Haskell.

## 2.4.2 Documentation comments

Comments also like Haskell. Nice that we have `:doc` comments built-in to the
language with `|||`. Really cool that it auto-includes argument types with
`@arg` too!

## 2.4.3 Interactive programs

Wondering if function exports have to be done in-line or whether there's a way
to do them at the top of the module all at once.


# Exercises

## 1

- `(String, String, String)`
- `List String`
- `((String, String), String)`

see `02/Exercises.idr`
