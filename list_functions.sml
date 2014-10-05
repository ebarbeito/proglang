(* collection of functions that work with lists *)

(* sum the elemenets of a list *)
fun sum_list (l : int list) =
	if null l
	then 0
	else hd(l) + sum_list(tl l)

(* multiply the elements of a list *)
fun product_list (l : int list) =
	if null l
	then 1
	else hd(l) * product_list(tl l)

(* list of count from, to integers *)
fun count (from : int, to : int) =
	if from = to
	then from :: []
	else if from > to
	then from :: count(from-1, to)
	else from :: count(from+1, to)

(* list of a count down *)
fun countdown (x : int) =
	if x = 0
	then []
	else x :: countdown(x-1)

(* append list within another list *)
fun append (l1 : int list, l2 : int list) =
	if null l1
	then l2
	else hd(l1) :: append(tl(l1), l2)

(* list of first elements of list of pairs *)
fun firsts (l : (int * int) list) =
	if null l
	then []
	else (#1 (hd(l))) :: (firsts(tl l))

(* list of second elements of list of pairs *)
fun seconds (l : (int * int) list) =
	if null l
	then []
	else (#2 (hd(l))) :: (seconds(tl l))

(* sum the pair elements of integers of a list *)
fun sum_pair_list (l : (int * int) list) =
	sum_list(firsts(l)) + sum_list(seconds(l))

(* list of count up till an integer *)
fun countup_till (x : int) =
	let fun count (from : int) =
		if from = x
		then x :: []
		else from :: count(from + 1)
	in
		count 1
	end

(* max value of a list *)
fun max (l : int list) =
	if null l
	then NONE
	else let val max_tl = max(tl l)
	in
		if isSome max_tl andalso valOf max_tl > hd l
		then max_tl
		else SOME(hd l)
	end

