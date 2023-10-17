type 'a t
(*@ mutable model contents : 'a list *)

exception Empty

val create : unit -> 'a t
(*@ t = create ()
    ensures t.contents = [] *)

val push : 'a -> 'a t -> unit
(*@ push v q
    modifies q.contents
    ensures q.contents = v :: (old q.contents) *)

(** A helper ghost function to remove last element of a list *)
(*@ function rec remove_last (xs : 'a list) : 'a list =
      match xs with
      | [] | _ :: [] -> []
      | x :: xs -> x :: (remove_last xs) *)

(** A helper ghost function to read last element of a list *)
(*@ function rec last (xs : 'a list) : 'a option =
      match xs with
      | [] -> None
      | x :: [] -> Some x
      | _ :: xs -> last xs *)

val pop : 'a t -> 'a
(*@ v = pop q
    modifies q.contents
    ensures q.contents = remove_last (old q.contents)
    ensures match last q.contents with
             | None -> false
             | Some x -> v = x
    raises Empty -> q.contents = old q.contents = [] *)
