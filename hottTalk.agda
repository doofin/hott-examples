{-# OPTIONS --without-K #-}
open import lib.Basics
open import lib.Equivalences
module hottTalk where
data ℕ : Set where
  z : ℕ
  s : ℕ → ℕ

data ℕ' : Set where
  z' : ℕ'
  s' : ℕ' → ℕ'

nrec : {A : Set} -> A -> (ℕ -> A -> A) -> ℕ -> A
nrec a f z = a
nrec a f (s n) = f n (nrec a f n)

nind : {C : ℕ -> Set} ->
  C z ->((n : ℕ) -> C n -> C (s n) ) ->
  ((n : ℕ)-> C n)
nind c0 _ z = c0
nind c0 cs (s n) = cs n (nind c0 cs n)

n'ind : {C : ℕ' -> Set} ->
  C z' ->((n : ℕ') -> C n -> C (s' n) ) ->
  ((n : ℕ')-> C n)
n'ind c0 _ z' = c0
n'ind c0 cs (s' n) = cs n (n'ind c0 cs n)

doubleN : ℕ -> ℕ -- C n
doubleN = nind z (\ _ n -> s (s n))

n2n' : ℕ -> ℕ'
n2n' = nind z' (\ _ n' -> s' n')

n'2n : ℕ' -> ℕ
n'2n =  n'ind z (\ _ n' -> s  n')

-- ap :  x == y -> f x == f y
-- transport : ∀ {i j} {A : Type i} (B : A → Type j) {x y : A} (p : x == y)
--  → (B x → B y)
n~n' : is-equiv n2n' -- simple version
n~n' = is-eq
  n2n' --  (f : A → B)
  n'2n --  (g : B → A)
  (n'ind {λ x → n2n' (n'2n x) == x} idp (λ _ x='=y → ap s' x='=y )) -- (f-g : (b : B) → f (g b) == b) ,idp :0==0
  (nind {λ x → n'2n (n2n' x) == x} idp (λ _ x==y → ap s x==y ))
 -- (g-f : (a : A) → g (f a) == a)
doubleN' : ℕ' -> ℕ' -- double from univalence . transport:  a~b -> pa -> pb
doubleN' = transport ( λ a → a → a) (ua (n2n' , n~n')) (doubleN) -- P , n == n' , double n -> double n'
-- define + with recursor for natural number,2 
-- using currying,the type A is ℕ

doubleN'nouniv : ℕ' -> ℕ'
doubleN'nouniv n' = n2n' (doubleN (n'2n n'))


pN pN2 : ℕ -> ℕ -> ℕ
pN x y = nrec y (\ _ b -> s b) x
-- another definition,the type a is ℕ->ℕ, 
pN2  = nrec (\ x -> x) (\ _ f b -> s (f b)) 


ap1 : ∀ {i j} {A : Type i} {B : Type j} (f : A → B) {x y : A}
  → (x == y → f x == f y)
ap1 f {x }  =  J  (\ z p ->  (f x) == (f z))  idp 

J1 : {A : Set} {a : A} (B : (a' : A) (p : a == a') → Set) (d : B a idp)
  {a' : A} (p : a == a') → B a' p
J1 B d idp = d

-- boo : (a : bool) -> (f : bool -> Set) -> f a
-- boo a f = f a







_+_ : ℕ -> ℕ -> ℕ
z + m = m
(s n) + m = s (n + m)

_++_ : ℕ -> ℕ -> ℕ
z ++ y = {!   !}
s x ++ y = {!   !}

pn : ℕ -> ℕ -> ℕ -- multiplication of n
pn = nind (\ x -> x ) (\ (n : ℕ) -> \ op -> \ m -> n + (op m)  )
--        * zero                      op= + n           (m + n) 

_*_ : ℕ -> ℕ -> ℕ
(s z) * m = m
z * m = z
(s n ) * m = m + (n * m)

succ= : {x y : ℕ} -> x == y -> s x == s y
succ= p = (ap s p) 

-- (z + x ) + y =def x+y =def x+(y+z)
-- s ((a+b)+c) =rdef s (a+b) +c =(s a)+(b+c)=def s(a+(b+c))
+assocz : (b c : ℕ)->((z + b) + c ) == (z + (b + c))
+assocz b c = idp

+assoc : (a b c : ℕ) -> ((a + b) + c ) == (a + (b + c))
+assoc  = nind (\ _ _ -> idp ) (\ _ p -> (\ b c -> ap s (p b c)))

+assoc2 : (a b c : ℕ) -> ((a + b) + c ) == (a + (b + c))
+assoc2 = nind  (λ b c →   idp ) ( \ _ p b c -> ap s (p b c) )

lemcom : (a b : ℕ) -> (a + (s b)) == s (a + b) 
lemcom = nind (\ _ -> idp) (\ _ cn -> (\ b -> ap s (cn b)))

runitN : (m : ℕ)-> (m + z ) == m
runitN  = nind idp (\ _ cn -> ap s cn)

transitive : ∀ {A : Set} (a b c : A) → a == b → b == c → a == c
transitive _ _ _ idp idp = idp

+comm : (a b : ℕ) -> (a + b)==(b + a)
+comm  =
  nind  {(λ a -> ( (b : ℕ) -> (a + b)==(b + a)))}
        (λ b → ! (nind {λ m -> (m + z) == m} idp (\ _ cn -> ap s cn) b))
        (λ a hyp b → ap s (hyp b) ∙ ! (lemcom b a))
nrec1 : {A : Set} -> A -> (ℕ -> A -> A) -> ℕ -> A
nrec1 zc nc n = nind zc nc n




-- +comm' : (a b : ℕ) -> (a + b)==(b + a)
-- +comm' = nind (\ b -> runitN b) (\ a cn ->(\ b -> (ap s (cn a b)) ∙ (lemcom a b ) ))
