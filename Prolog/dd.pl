pos(1,1,empty).
pos(1,2,empty).
pos(1,3,empty).
pos(1,4,empty).
pos(1,5,empty).
pos(1,6,empty).
pos(2,1,empty).
pos(2,2,empty).
pos(2,3,blocked).
pos(2,4,blocked).
pos(2,5,empty).
pos(2,6,blocked).
pos(3,1,empty).
pos(3,2,empty).
pos(3,3,blocked).
pos(3,4,empty).
pos(3,5,empty).
pos(3,6,robot).
pos(4,1,empty).
pos(4,2,blocked).
pos(4,3,empty).
pos(4,4,empty).
pos(4,5,blocked).
pos(4,6,empty).
pos(5,1,empty).
pos(5,2,empty).
pos(5,3,empty).
pos(5,4,blocked).
pos(5,5,blocked).
pos(5,6,empty).
pos(6,1,empty).
pos(6,2,blocked).
pos(6,3,empty).
pos(6,4,empty).
pos(6,5,empty).
pos(6,6,empty).
make_line :- write('-------------------------').

show_box(N,M):- pos(N,M,Z), (Z==empty, write('|'), tab(3);
 Z==blocked, write('| X '); Z==robot, write('| R ')).

show_row(N):- make_line, nl, show_box(1,N), show_box(2,N),
 show_box(3,N), show_box(4,N), show_box(5,N),
 show_box(6,N), write('|'), nl.

show_grid:- show_row(6), show_row(5), show_row(4), show_row(3),
show_row(2), show_row(1),make_line, nl, nl.

move_down:- pos(X,Y,robot), Y>=2, Y1 is Y-1, pos(X,Y1,Z), Z==empty,
retract(pos(X,Y,robot)), assert(pos(X,Y,empty)),
retract(pos(X,Y1,empty)), assert(pos(X,Y1,robot)).

move_right:- pos(X,Y,robot), X=<5, X1 is X+1, pos(X1,Y,Z), Z==empty,
retract(pos(X,Y,robot)),assert(pos(X,Y,empty)),
retract(pos(X1,Y,empty)), assert(pos(X1,Y,robot)).

move_left:- pos(X,Y,robot), X>=2, X1 is X-1, pos(X1,Y,Z), Z==empty,
retract(pos(X,Y,robot)), assert(pos(X,Y,empty)),
retract(pos(X1,Y,empty)), assert(pos(X1,Y,robot)).

move_up:- pos(X,Y,robot), Y=<5, Y1 is Y+1, pos(X,Y1,Z), Z==empty,
    retract(pos(X,Y,robot)), assert(pos(X,Y,empty)),
    retract(pos(X,Y1,empty)), assert(pos(X,Y1,robot)).
