
module FSM_adder_moore (a,b, clk, sum,carry , rst);
   input a,b,clk,rst;
   output reg sum,carry;
   reg [1:0] pr_state;
reg [1:0] nxt_state;
   parameter s0=2'b00, s1=2'b01 , s2=2'b10, s3=2'b11 ;
   always @(posedge clk)
     begin
        if(rst)
          pr_state <= s0;
        else
          pr_state <= nxt_state;
     end
   always @(pr_state ,a,b)
     begin
       case (pr_state)
         s0: begin
               if(!a && !b) begin
                   nxt_state<=s0;
                    end
               else if(!a && b) begin
                   nxt_state<=s1;
                   end
              else if(a && !b) begin
                   nxt_state <=s1;
                   end
              else if(a && b) begin
                   nxt_state  <=s2;
                    end

             end
         s1: begin
                if(!a && !b) begin
                   nxt_state <=s0;
                    end
               else if(!a && b) begin
                   nxt_state <=s1;
                    end
              else if(a && !b) begin
                   nxt_state <=s1;
                    end
              else if(a && b) begin
                   nxt_state <=s2;
                    end

             end
          s2: begin
                if(!a && !b) begin
                   nxt_state <=s1;
                    end
               else if(!a && b) begin
                   nxt_state <=s2;
                    end
              else if(a && !b) begin
                   nxt_state <=s2;
                    end
              else if(a && b) begin
                   nxt_state <=s3;
                    end

             end
          s3: begin
                if(!a && !b) begin
                   nxt_state <=s1;
                    end
               else if(!a && b) begin
                   nxt_state <=s2;
                    end
              else if(a && !b) begin
                   nxt_state <=s2;
                    end
              else if(a && b) begin
                   nxt_state <=s3;
                    end

             end


         default: begin nxt_state  <= s0;
                       end
       endcase
     end
   always @(pr_state)
      begin
         case(pr_state)
           s0:  begin carry=0; sum=0; end
           s1: begin carry =0 ; sum=1; end
           s2: begin carry=1; sum=0; end
           s3: begin carry=1; sum=1; end
           default :begin  carry=0; sum=0; end
         endcase
     end
endmodule




