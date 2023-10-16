type 'a t = 'a Queue.t

exception Empty

let create = Queue.create
let push = Queue.push
let pop = Queue.pop
