module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    parameter s0=0, s1=1, s2=2, s3=3;
    reg [1:0] state, next;
    assign state=(reset)?s1:next;
    always@(posedge clk) begin
        case(state)
            s0:begin
                if (in[3]==1)
                    next<=s2;
                else
                    next<=s1;
            end
            s1:begin
                if (in[3]==1)
                    next<=s2;
                else
                    next<=s1;
            end
            s2:next<=s3;
            s3:next<=s0;
            default: next<=s1;
        endcase
    end
    assign done = (state==s0)?1:0;
endmodule
