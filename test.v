

class Packet;


//随机变量
rand bit [31:0] src,dst,data[8];
randc bit [7:0] kind;


//src的约束
constraint c
{                    //放在{}而不是begin end是强调这段代码的声明性质非程序性质
   src > 10;
   src < 15;
}
   
endclass


Packet p;
initial 
   begin
      p=new();    //产生一个包
      assert (p.randomize());
      else $fatal(0,"Packet::randomize failed ");
      transmit(p);
   end



rand int src,dst
constraint c_dist
{
   src dist {0:=40,[1:3]:=60};
   //src=0,weight=40/220 
   //src=1,weight=60/220 
   //src=2,weight=60/220 
   //src=3,weight=60/220 
}
