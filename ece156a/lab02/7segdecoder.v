module sevenseg(display, a, b, c, d);

input a, b, c, d;
output [6:0] display;

wire nota, notb, notc, notd;
not(nota, a);
not(notb, b);
not(notc, c);
not(notd, d);

wire amid1, amid2, amid3, amid4;
and(amid1, nota, notb, notc, d);
and(amid2, nota, b, notc, notd);
and(amid3, a, notb, c, d);
and(amid4, a, b, notc, d);
or(display[0], amid1, amid2, amid3, amid4);

wire bmid1, bmid2, bmid3, bmid4;
and(bmid1, b, c, notd);
and(bmid2, a, c, d);
and(bmid3, a, b, notd);
and(bmid4, nota, b, notc, d);
or(display[1], bmid1, bmid2, bmid3, bmid4);

wire cmid1, cmid2, cmid3;
and(cmid1, a, b, notd);
and(cmid2, a, b, c);
and(cmid3, nota, notb, c, notd);
or(display[2], cmid1, cmid2, cmid3);

wire dmid1, dmid2, dmid3, dmid;
and(dmid1, b, c, d);
and(dmid2, nota, notb, notc, d);
and(dmid3, nota, b, notc, notd);
and(dmid4, a, notb, c, notd);
or(display[3], dmid1, dmid2, dmid3, dmid4);

wire emid1, emid2, emid3;
and(emid1, nota, d);
and(emid2, notb, notc, d);
and(emid3, nota, b, notc);
or(display[4], emid1, emid2, emid3);

wire fmid1, fmid2, fmid3, fmid4;
and(fmid1, nota, notb, d);
and(fmid2, nota, notb, c);
and(fmid3, nota, c, d);
and(fmid4, a, b, notc, d);
or(display[5], fmid1, fmid2, fmid3, fmid4);

wire gmid1, gmid2, gmid3;
and(gmid1, a, b, notc, notd);
and(gmid2, nota, b, c, d);
and(gmid3, nota, notb, notc);
or(display[6], gmid1, gmid2, gmid3);


endmodule
