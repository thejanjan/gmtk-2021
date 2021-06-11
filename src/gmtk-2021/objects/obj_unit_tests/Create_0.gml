/// @description Makes sure everything doesn't break because that would be REALLY EMBARRASSING
// You can write your code in this editor <== so true

// Vector operations.
assert_equal("test_assert_happy", true, true);
//assert_equal("test_assert_sad", true, false);
assert_true("test_vector_equal", vector_equal([2, 3], [2, 3]));
assert_true("test_vector_add", vector_equal(vector_add([2, 3], [5, 6]), [7, 9]));
assert_true("test_vector_subtract", vector_equal(vector_subtract([2, 3], [5, 6]), [-3, -3]));
assert_equal("test_vector_magnitude", vector_magnitude([3, 4]), 5);
assert_true("test_vector_normalize", vector_equal(vector_normalize([5, 0]), [1, 0]));
assert_equal("test_vector_dot_product", vector_dot([2, 3], [5, 6]), 28);

// Keyboard bindings.
assert_equal("test_binding_name", new_keyboard_get_name(global.binding_up), ord("W"));

// Dude, we're done here.
game_end();