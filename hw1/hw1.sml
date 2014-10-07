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

(*
 * Write a function dates_in_months that takes a list of dates and a list of
 * months (i.e., an int list) and returns a list holding the dates from the
 * argument list of dates that are in any of the months in the list of
 * months. Assume the list of months has no number repeated. Hint: Use your
 * answer to the previous problem and SML’s list-append operator (@).
 *)
fun dates_in_months(dates : (int * int * int) list, months : int list) =
	if null months
	then []
	else let val month = hd months
	in
		dates_in_month(dates, month) @ dates_in_months(dates, tl months)
	end

(*
 * Write a function get_nth that takes a list of strings and an int n and
 * returns the n-th element of the list where the head of the list is 1st. Do
 * not worry about the case where the list has too few elements: your
 * function may apply hd or tl to the empty list in this case, which is okay.
 *)
fun get_nth (strs : string list, n : int) =
	if n < 1 orelse null strs
	then ""
	else if n = 1
	then hd strs
	else get_nth(tl strs, n-1)

(*
 * Write a function date_to_string that takes a date and returns a string of
 * the form January 20, 2013 (for example). Use the operator ^ for
 * concatenating strings and the library function Int.toString for converting
 * an int to a string. For producing the month part, do not use a bunch of
 * conditionals. Instead, use a list holding 12 strings and your answer to
 * the previous problem. For consistency, put a comma following the day and
 * use capitalized English month names: January, February, March, April, May,
 * June, July, August, September, October, November, December.
 *)
fun date_to_string (date : int * int * int) =
	let val strmonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	in
		get_nth(strmonths, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
	end

