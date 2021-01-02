# hott-examples
A crash course and notes on HoTT.

hottTalk.agda : 

Simple examples in Homotopy type theory showing basic usage of the Univalence. (It contains the whole HoTT library code for convenience  [https://github.com/HoTT/HoTT-Agda])

Use univalence to transport functions , doubleN to doubleN' (providing two isomorphic functions on N and N')

Use recursor of N to define function from N to Any type

Note ! you can't actually run the code,because Univalence is postulated as an axiom,which does not compute.There are several lines of research intented to make it compute,currently the most promising theory is the cubical method,with an implementation named cubical agda.More about this later.

# how to run(not actually run,just type check)

install agda (via haskell cabal)

open HottTalk.agda ,and load it.There should be no errors reported by emacs.

have fun!

# theory
## run Univalence
Being merely as a axiom,the Univalence axiom just can't be run .Thus we developed a more complex theory : cubical type theory,to further 'formalize' HoTT and the univalence,so that we can actually run it.

## relation to algebraic topology
higher inductive types ~ CW complex

# cubical type theory
Congrats! You decided to move deeper.For better understanding,I recommand reading the following materials in order:

logic in computer science book

A model of type theory in cubical sets

Cubical Type Theory: a constructive interpretation .. (CCHM model)

# more info

HoTT Summer School/Workshop 201x-202x,where you can find lots of talks,confs,etc, a very important resource.

Below is the link to 2019:

[https://hott.github.io/HoTT-2019/summer-school/]

spring school

[https://epit2020cnrs.inria.fr/]

events:

https://ncatlab.org/homotopytypetheory/show/Events

intro to cubical types:

[https://staff.math.su.se/anders.mortberg/papers/cubicalmethods.pdf]

blog

[http://math.andrej.com/]


