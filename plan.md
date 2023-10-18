# Ortac qcheck-stm plugin

## What is QCheck-STM?

- model based testing
- based on a description of the tested library
- description is given by the user in an OCaml module

ortac qcheck-stm generates the OCaml module from Gospel specifications

## How does it work?

demo

- wrong spec (old in match queue pop ensures)
- stupid bug in implementation
- show generated code

## Limitations

- need a particular style of specification (often stronger postconditions than
  necessary otherwise) (*eg* `Hashtbl.add`) -> idea of a rewriting system?

- exception specification in Gospel (not an easy and natural way of telling the
  tool in which conditions an exception is raised) (see `Queue.pop`) -> discussion on syntax
  exceptional precondition: `P -> raises E /\ raises E -> Q`

other syntax problems:
- `exists` as keyword (and others)
- `[ x ]` pattern
- `->` in implication, match and function (why not `=>`/`@=>`/`@->`/`^->`)
- revise keywords (requires -> preconditions -- ensures -> postconditions...)

# Gospel release

## new ppx

In `gospel.ppx` subpackage. Takes `gospel` attributes to add a documentation
one with the same contents and a minimal layout.

```dune
(library
 (name lib)
 (preprocess
  (pps gospel.ppx -- -pp "gospel pps")))
```

HTML rendering is not great. There is room for small improvement.
- syntax highlighting
- before informal documentation
- do we need `gospel specification` and `gospel declaration`?

But at some point, if we really want something better, we need to make `gospel`
talk with `odoc` (design an intermediate representation, for stability and
simplicity on the `odoc` side).

## gospel stdlib in documentation

Thanks to the new `gospel.ppx`, we were able to display the `Gospelstdlib`
in the online documentation.

On can also generate the manpage and install it locally :-)

## pps improved (bugs and performances)

Documentation attribute ended up detached after pps. We've fixed that and took
the opportunity to try to better mimic OCaml parser behaviour attribute-wise.
Also, any order between gospel specifications and informal documentation are
now supported as long as there are no blank lines between them.

## cleanup and reorganization of the test directory

We believe this increase readibility of tests.
We add a new `issue` directory and try to track the respecting problems in
github issues.

## Other improvements

- Pattern matching exhaustivness and redundancy checking
- A dumpast subcommand for development purposes
- We can now destruct a tuple in anonymous functions.
- And use partial application.
- Better location tracking
- Fixed a couple of error message (or replace some internal failures with
  proper error message)


# Future

- battle test qcheck-stm plugin
- dune support
- continue gospel maintenance (there is already a milestone 0.3 for next release)
