# [Hindley-Milner](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system) with [Free Foil](https://github.com/fizruk/free-foil)

> 🚧 WIP 🚧

## Development

Make sure [Stack](https://docs.haskellstack.org/en/stable) is installed, then you can:

```sh
# Build project
stack build
```

## Roadmap (preliminary)

### 0. Preparation

- [x] Setup repository with Stack
- [x] Configure BNF Converter

### 1. Simply-typed expressions

- [ ] Simple expressions grammar and parsing
  - [ ] Natural number literals
  - [ ] Boolean literals
  - [ ] Addition (`+`)
  - [ ] iszero
  - [ ] if-then-else
- [ ] Evaluation
- [ ] Typechecking (e.g. `(1 + true)` should trigger a type error)
- [ ] REPL

### 2. Let-bindings with variables

- [ ] Add Free Foil and TH for bound variables
- [ ] Implement for-loop

### 3. Simply Typed Lambda Calculus (STLC)

- [ ] Function types
- [ ] Abstraction (with explicit type of the argument: `λx:T. t`)
- [ ] Application (local inference)

### 4. System F

- [ ] Typechecking with local inference

### 5. Hindley-Milner

- [ ] Type unification
- [ ] Algorithm W

### 6. Extensions

- [ ] Remy algorithm
- [ ] Arbitrary-rank polymorphism
- [ ] HM(X)
- [ ] OutsideIn(X)
