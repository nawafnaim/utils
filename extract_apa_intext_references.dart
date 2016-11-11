import 'dart:io';
import 'dart:async';

main(List<String> args) async {

  String input = await new File('bin/input.txt').readAsString();
  // regex needs to account for non-letter characters like ' and -  
  RegExp refReg = new RegExp(r'([A-Z][a-z]+ +et\.? +al\.? +\(\d{4}\))|(\([A-Z][a-z]+ +et\.? +al\.?, +\d{4}\))|((([A-Z][a-z]+,? +)+& +)?([A-Z][a-z]+ ?)+, +\d{4})|((([A-Z][a-z]+,? +)+and +)?[A-Z][a-z]+ +\(\d{4}\))|(((([A-Z][a-z]+)?[A-Z][a-z]+,? +)+& +)?([A-Z][a-z]+)?[A-Z][a-z]+, +\d{4};?)');

  List<Match> matches = await refReg.allMatches(input).toList();

  List<String> refs = [];

  matches.forEach((Match m) {
    String r = m.group(0);
    if (!refs.contains(r)) {
      refs.add(r);
    }
  });

  print(refs.length);
  refs.sort();
  refs.forEach(print);
}
