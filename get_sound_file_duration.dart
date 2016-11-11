import 'dart:io';
import 'dart:convert';

main() {

  // afinfo *.wav | awk '/estimated duration/ { print $3 }
  Process.run("/bin/sh", ['-c', "afinfo *.wav | awk '/estimated duration/ { print \$3 }'"])
    .then((p) {
    double r = 0;
    p.stdout.split('\n').forEach((l) {
      if (l != "") {
        r += double.parse(l);
      }
    });
    print(r/60/60);
  });
}
