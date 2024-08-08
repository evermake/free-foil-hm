## Getting Started

### Requirements

- Install GHCup
- Install [just](https://github.com/casey/just)
- Update cabal index: `cabal update`
- Install bnfc (`cabal install BNFC`)
- Install alex (`cabal install alex`)
- Generate parser: `just generate-parser`

Optional:

- Install cabal-fmt (`cabal install cabal-fmt`)

### Commands

Build interpreter (and generate parser from `grammar/HM.cf`):

```sh
stack build
```

From time to time, if you change sometime in the grammar, you might need to clean:

```sh
stack clean && stack build
```

To run the interpreter:

```sh
stack run
```

## Plan

0. Implement simply-typed expressions
   - Natural numbers (literals, addition, iszero) + Booleans (literals, if-then-else)
   - Types: Nat, Bool
   - Use BNF Converter (you can see lambda-pi package in free-foil repository)
   - REPL
   - typecheck ((1 + true) should trigger a type error)
1. Add let-bindings with variables to simply-typed expressions
   - use free foil + TH (for bound variables)
   - maybe add for-loop
2. STLC (simply typed lambda calculus)
   - function types
   - lambda abstraction with explicit type of the argument (λx:T. t)
   - function application (local inference)
3. System F (only typechecking, local inference)
4. Hindley-Milner type inference
   - Implement/reuse unification of types
   - Implement Algorithm W
5. Work towards extensions (Remy algorithm, arbitrary-rank polymorphism, HM(X), OutsideIn(X))
