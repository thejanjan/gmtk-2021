// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function assert_equal(_testname, _condition1, _condition2){
	if _condition1 == _condition2 {
		return true;
	} else {
		// NOOOOOOOOO! NO NO NO NOOOOO!!! THAT'S WROOOOOOOONG!!!
		show_message("assert_equal failed for " + _testname);
		return false;
	}
}

function assert_true(_testname, _cond) {
	return assert_equal(_testname, _cond, true);
}