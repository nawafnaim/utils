import 'dart:math';

main(List<String> args) {
  List<int> nums = generate_random_numbers(31, 999, 9999); // using slots count
  
  nums.forEach(print);
}

List<int> generate_random_numbers(int count, int min, int max) {
  List<int> nums = new List<int>();
  var rng = new Random();
  var num = rng.nextInt(max);
  for (var i = 0; i < count; i++) {
    num = rng.nextInt(max);
    while(num < min) {
      num = rng.nextInt(max);
    }
    nums.add(num);
  }
  return nums;
}
