# hott-examples

Some simple examples in Homotopy type theory showing basic usage of the Univalence. (It contains the whole HoTT library code for convenience  [https://github.com/HoTT/HoTT-Agda])

However,you can't actually run the code,because Univalence is postulated as an axiom,which does not compute.There are several lines of research intented to make it compute,currently the most promising theory is the cubical method,with an implementation named cubical agda.

hottTalk.agda : 

Use univalence to transport functions , doubleN to doubleN' (providing two isomorphic functions on N and N')

Use recursor of N to define function from N to Any type

# how to run

install agda (via haskell cabal)

open HottTalk.agda ,and load it.There should be no errors reported by emacs.

have fun!

# theory
## run Univalence
Being merely as a axiom,the Univalence axiom just can't be run .Thus we developed a more complex theory : cubical type theory,to further 'formalize' HoTT and the univalence,so that we can actually run it.

## relation to algebraic topology
higher inductive types ~ CW complex

# more 

HoTT Summer School 2019

[https://hott.github.io/HoTT-2019/summer-school/]

intro to cubical types:

[https://staff.math.su.se/anders.mortberg/papers/cubicalmethods.pdf]




