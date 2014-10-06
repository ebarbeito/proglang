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

(*
 * Write a function number_in_months that takes a list of dates and a list of
 * months (i.e., an int list) and returns the number of dates in the list of
 * dates that are in any of the months in the list of months.
 * Assume the list of months has no number repeated. Hint: Use your answer to
 * the previous problem.
 *)
fun number_in_months (dates : (int * int * int) list, months : int list) =
	if null months
	then 0
	else let val month = hd months
	in
		number_in_month(dates, month) + number_in_months(dates, tl months)
	end

(*
 * Write a function dates_in_month that takes a list of dates and a month
 * (i.e., an int) and returns a list holding the dates from the argument list
 * of dates that are in the month. The returned list should contain dates in
 * the order they were originally given.
 *)
fun dates_in_month(dates : (int * int * int) list, month : int) =
	if null dates
	then []
	else let val ans = dates_in_month(tl dates, month)
	in
		if #2 (hd dates) = month
		then hd dates :: ans
		else ans
	end

(*fun dates_in_month(dates : (int * int * int) list, month : int) =
	if null dates
	then []
	else let val ans = if #2 (hd dates) = month then [hd dates] else []
	in
		hd ans :: dates_in_month(tl dates, month)
	end*)

