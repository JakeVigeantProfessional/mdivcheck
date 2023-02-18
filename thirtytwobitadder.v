module thirtytwobitadder(S,A,B,Cout, cin);
  input [31:0]A;
  input [31:0]B;
  input cin;
  output [31:0]S;
  output Cout;
  wire G0,P0,p0c0,c8,p0,G1,P1,p1g0,p1p0c0,p1,c16,G2,P2,p2g1,p2p1g0,p2p1p0c0,c24,G3,P3,p3g2,p3p2g1,p3p2p1p0c0,p3p2p1g0;
  //first carrybit
  bitbybit8 eight1(S[7:0],A[7:0],B[7:0],G0,cin,P0);
  and a1088(p0c0,P0,cin);
  or o18098(c8,G0,p0c0);
  bitbybit8 eight2(S[15:8],A[15:8],B[15:8],G1,c8,P1);
  and a288(p1g0,P1,G0);
  and a7773(p1p0c0,P1,P0,cin);
  or o290987(c16,G1,p1g0,p1p0c0);
  bitbybit8 eight3(S[23:16],A[23:16],B[23:16],G2,c16,P2);
  and a9895(p2g1,P2,G1);
  and a9862(p2p1g0,P2,P1,G0);
  and a78793(p2p1p0c0,P2,P1,P0,cin);
  or o28908(c24,G2,p2g1,p2p1g0,p2p1p0c0);
  bitbybit8 eight4(S[31:24],A[31:24],B[31:24],G3,c24,P3);
  and a76675(p3g2,P2,G1);
  and a5889(p3p2g1,P3,P2,G1);
  and a672(p3p2p1g0,P3,P2,P1,G0);
  and a8983(p3p2p1p0c0,P3,P2,P1,P0,cin);
  or o29090(Cout,G3,p3g2,p3p2g1,p3p2p1g0,p3p2p1p0c0);




endmodule
