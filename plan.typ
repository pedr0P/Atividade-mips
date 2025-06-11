= Goal:
Sort the vector:
#align(center)[vec: .word *$10, 9, 8, 7, 6, 5, 4, 3, 2, 1$*]


=== Plan:
Have a "pointer" to 0(vec) and another to 4(vec).

Then, do the following:

Loop #box(height: 2pt, line(length: 94%))

if (vec[0] > vec[1]) {
\ #h(1cm)swap(\*vec[0], \*vec[1])
\ }

if (vec[1] == vec[max]) {
\ #h(1cm)if (vec[0] == vec[1]-4) {
\ #h(2cm)    exit();
\ #h(1cm)}
\ #h(1cm)vec[0]+4;
\ #h(1cm)vec[1] = vec[0]+4;
\ }
\ else {
\ #h(1cm)vec[1]+4;
\ }

#line(length: 100%)
