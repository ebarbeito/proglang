(* homework 1 *)

(*
 * Write a function is_older that takes two dates and evaluates to true or
 * false. It evaluates to true if the first argument is a date that comes
 * before the second argument. (If the two dates are the same, the result
 * is false.)
 *)
fun is_older (d1 : int * int * int, d2 : int * int * int) =
    if d1 = d2
	then false
	else if #1 d1 < #1 d2
	then true
	else if (#1 d1 = #1 d2) andalso (#2 d1 < #2 d2)
	then true
	else if (#1 d1 = #1 d2) andalso (#2 d1 = #2 d2) andalso (#3 d1 < #3 d2)
	then true
	else false

(*
 * Write a function number_in_month that takes a list of dates and a month
 * (i.e., an int) and returns how many dates in the list are in the given
 * month.
 *)
fun number_in_month (dates : (int * int * int) list, month : int) =
	if null dates
	then 0
	else let val ans = if #2 (hd dates) = month then 1 else 0
	in
		ans + number_in_month(tl dates, month)
	end
