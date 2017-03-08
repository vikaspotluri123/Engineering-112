t1 = Turtle();
t2 = Turtle();
t2.pen.color = ('red');
t2.pen.width = 3;
x = 0;
y = 1;
while y < 13
  for i=1:4
    t1 = t1.forward(y);
    t1 = t1.left();
  end
  t1 = t1.forward(y);
  t1 = t1.left();
  t1 = t1.forward(y);
  for i=1:90
    t2 = t2.forward(2*pi*y/360);
    t2 = t2.rotate(1);
  end
  z = x+y;
  x = y;
  y = z;
end
