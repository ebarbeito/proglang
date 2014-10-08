(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val test1_1 = is_older((1,2,3),(1,2,3)) = false
val test1_2 = is_older((1,2,3),(2,3,4)) = true
val test1_3 = is_older((2,3,4),(1,2,3)) = false

val test2_1 = number_in_month([],2) = 0
val test2_2 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1
val test2_3 = number_in_month([(2012,2,28),(2013,12,1),(2013,2,1)],2) = 2
val test2_4 = number_in_month([(2012,2,28),(2013,12,1),(2012,2,28),(2013,2,1)],2) = 3

val test3_1 = number_in_months([],[]) = 0
val test3_2 = number_in_months([],[2,3,4]) = 0
val test3_3 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test3_4 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_5 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,12]) = 4

val test4_1 = dates_in_month([],2) = []
val test4_2 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4_3 = dates_in_month([(2012,2,28),(2013,12,1),(2014,2,3)],2) = [(2012,2,28),(2014,2,3)]

val test5_1 = dates_in_months([],[]) = []
val test5_2 = dates_in_months([],[2,3,4]) = []
val test5_3 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val test5_4 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = [(2012,2,28),(2011,3,31)]
val test5_5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test6_1 = get_nth([], 2) = ""
val test6_2 = get_nth(["hi", "there", "how", "are", "you"], 0) = ""
val test6_3 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
val test6_4 = get_nth(["hi", "there", "how", "are", "you"], 5) = "you"
val test6_5 = get_nth(["hi", "there", "how", "are", "you"], 6) = ""

val test7_1 = date_to_string((2013, 6, 1)) = "June 1, 2013"
val test7_2 = date_to_string((2013, 12, 31)) = "December 31, 2013"

val test8_1 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3
val test8_2 = number_before_reaching_sum(13, [1,2,3,6,1,4,7]) = 4

val test9_1 = what_month(1) = 1
val test9_2 = what_month(365) = 12
val test9_3 = what_month(70) = 3

val test10_1 = month_range(1, 1) = [1]
val test10_2 = month_range(31, 32) = [1,2]
val test10_3 = month_range(31, 34) = [1,2,2,2]
val test10_4 = month_range(89, 91) = [3,3,4]


val test11_1 = oldest([]) = NONE
val test11_2 = oldest([(2011,3,31)]) = SOME (2011,3,31)
val test11_3 = oldest([(2012,2,28),(2011,3,31),(2010,4,28)]) = SOME (2010,4,28)
val test11_4 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test12_1 = number_in_months_challenge([],[]) = 0
val test12_2 = number_in_months_challenge([],[2,3,4,2,3]) = 0
val test12_3 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test12_4 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,2,3]) = 3
val test12_5 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,12,2,3,12]) = 4
val test12_6 = dates_in_months_challenge([],[]) = []
val test12_7 = dates_in_months_challenge([],[2,3,4,2,3]) = []
val test12_8 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val test12_9 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,2]) = [(2012,2,28),(2011,3,31)]
val test12_10 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,2,3]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test13_1 = reasonable_date((0,0,0)) = false
val test13_2 = reasonable_date((1970,0,0)) = false
val test13_3 = reasonable_date((0,1,0)) = false
val test13_4 = reasonable_date((1970,1,0)) = false
val test13_5 = reasonable_date((0,0,1)) = false
val test13_6 = reasonable_date((1970,0,1)) = false
val test13_7 = reasonable_date((0,1,1)) = false
val test13_8 = reasonable_date((1970,1,1)) = true
val test13_9 = reasonable_date((2014,2,28)) = true
val test13_10 = reasonable_date((2014,2,29)) = false
val test13_11 = reasonable_date((2012,2,29)) = true
val test13_12 = reasonable_date((2014,13,1)) = false
val test13_13 = reasonable_date((2014,12,32)) = false
val test13_14 = reasonable_date((2014,12,31)) = true
val test13_15 = reasonable_date((2014,1,32)) = false
val test13_16 = reasonable_date((2014,1,31)) = true
val test13_17 = reasonable_date((2014,6,31)) = false
val test13_18 = reasonable_date((2014,7,31)) = true

