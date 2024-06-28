
module FSM_adder_moore_tb;
wire detected;
reg a,b,clk,rst;
 FSM_adder_moore M  (a,b, clk, sum,carry , rst);
 initial 
  begin
    $monitor($time,"a=%b b=%b sum =%b carry=%b",a,b,sum,carry);
  end
 always
  #5 clk = ~clk;
 initial
  begin 
  clk = 1'b0;
  rst = 1'b1;
  #10 rst = 1'b0;
  #12 a=0;b=0; #10 a=0;b=1; #10 a=1;b=0; #10 a=1;b=1; #10 a=0;b=0; #10 a=0;b=1; #10 a=1;b=0; #10 a=1;b=1;
  #100 $finish;
  end
endmodule