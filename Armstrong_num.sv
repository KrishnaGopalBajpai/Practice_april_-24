//Correct and working code... for Armstrong

/*
class cons;
 
    //rand
    rand int num; //=1634;
    int j,a;
    //constraint c1{num ==1634;}
    extern constraint range;
    extern function int digits(int num);
    extern function void post_randomize();
endclass
 
    constraint cons :: range {num inside {[10 : 1000]};}
 
    function int cons :: digits(int num);

	while(num>0)
            begin
		num=num/10;
                j++;  
            end
       	    $display("j=%0d", j);
            return j;
    endfunction
 
    function void cons :: post_randomize();

        int temp, sum, rem, count;

        count=digits(num);
        $display("%0d", count);
        temp=num;

        for(int i=0; i<count; i++)
            begin
                rem=num%10;
                sum=(rem**count)+sum;
                num=num/10;
            end
 
         if(temp==sum)
            $display("%0d==%0d, num_after_logic=%0d, sum=%0d", temp, sum, num, sum);
        else
            $display("%0d!=%0d, num_after_logic=%0d, sum=%0d", temp, sum, num, sum);
    endfunction
 
    cons c;
 
module tb;
 
    initial begin
    c=new();
    repeat(10) begin
	c.j=0;
        void'(c.randomize());
        end
    end
endmodule
*/

//-----------------------------------------------------------//

/* wrong and non-working code....
class cons;

	rand int num; 
	//int num=1634;
	int j;

	extern constraint range;
	extern function int digits(int num);
	extern function void post_randomize();
endclass


	constraint cons :: range {num inside {[100 : 2000]};}


	function int cons :: digits(int num);
		int temp1, j;
			temp1=num;
		while(temp1>0)
			begin
				j=j+1;
				num=num/10;
				//j++;
			end
		return j;	
		$display("j=%0d", j);
	endfunction  

 

	function void cons :: post_randomize();
		int temp, sum, rem, count;

		//count=j;

		count=digits(num);

		$display("%0d", count);

		temp=num;
		
		for(int i=0; i<count; i++)
			begin
				rem=num%10;
				sum=(rem^count)+sum;
				num=num/10;
			end

		 if(temp==sum)
			$display("%0d==%0d", temp, num);
		else
			$display("%0d!=%0d", temp, num);
	endfunction  


	cons c;
	

module tb;

	//int d;

	initial begin
	c=new();
	
	//d=c.digits(num);
	
	repeat(10) begin
		void'(c.randomize());
		end   
	end
endmodule 
*/



/*
// Q) queue should not be same. 

class c;

	rand int q1[$];
	rand int q2[$];
	
	constraint c0 {q1.size inside {[10:20]} ; q2.size inside {[10:20]};}

	//constraint c1 {q1!=q2;}
	constraint c1 { foreach(q1[i]) q1[i] inside {[10:100]};}
	constraint c2 { foreach (q2[i]) q2[i] inside {[10:100]};}
	constraint c3 {foreach(q2[i])!(q2[i] inside {q1});}
	
	function void post_randomize();
		$display("q2 is %0p and q1 is %0p", q2, q1);
	endfunction
endclass


module tb;

	c c_h;

	initial begin
		c_h=new();
		repeat(10)
		void'(c_h.randomize());
	end
endmodule
*/




/*
class cons;

	rand bit [8:0]a;
	rand bit [8:0]b;

	extern constraint not_equal;
	extern constraint count;
	extern function void post_randomize();

endclass


constraint cons :: not_equal {a!=b;}
constraint cons :: count {$countones(a)==5;}
function void cons :: post_randomize();
	$display("a is %0b \n b is %0b", a,b);
endfunction

cons c;


module tb;

	initial begin
		c=new();
		repeat(1)begin
			void'(c.randomize());
		end
	end
endmodule
*/

//---------------------------------------------------------------------\\


/*
class  cons;

	rand bit[3:0]a[];
	constraint c2 { a.size()==10;}
	constraint c1 {foreach(a[i])
			foreach(a[j])
			 if(i!=j)
			  a[i]!=a[j];}
endclass

cons c;

module tb;

	initial begin
		c=new();
		void'(c.randomize());
		$display("%0p", c.a);
	end
endmodule   
*/

/*
class sample;
  rand bit [3:0] array[];

  constraint array_c {
    array.size() == 10;
    foreach (array[i]) {
      foreach (array[j]) {
        if(i != j) array[i] != array[j]; 
      }
    }
  }
endclass

module top;
  sample s = new();

  initial begin
    repeat (5) begin
      assert(s.randomize());
      $display("s=%p", s.array);
    end
  end
endmodule
*/

//----------------------------------------------------------------------------------------//

/*
class pat;

	rand int a[];
	//rand bit a[];
	extern constraint size;
	extern constraint logic_1;

endclass


constraint pat :: size{a.size()==10;}
constraint pat :: logic_1 { foreach(a[i])
				if(i==0) a[i]==i+1;
				else if (i%2==0) a[i]==a[i-2]+1;
				else a[i]==a[i-1];}

pat p_h;

module tb;
	
	initial begin
		p_h=new();
		repeat(10) begin
				void'(p_h.randomize());
				$display("%0p", p_h.a);
			end
	end
endmodule
*/

/*
VC_FORMAL>>>
>>> Automatic Extracted property checks (AEP)
>>> Data path Validation (DPV)
>>> Formal Coverage Analyzer (FCA)
*/

/*
class pat;

	rand int a[];
	extern constraint size;
	extern constraint logic_1;

endclass


constraint pat :: size{a.size()==10;}
constraint pat :: logic_1 { foreach(a[i])
				if(i<a.size()/2)
					a[i]==9+(i*1)*(-2);
				else
					a[i]==18+(i*1)*(-2); }
			

pat p_h;

module tb;
	
	initial begin
		p_h=new();
		repeat(10) begin
				void'(p_h.randomize());
				$display("%0p", p_h.a);
			end
	end
endmodule  */


/*
class pat;

	rand int a[];
	extern constraint size;
	extern constraint logic_1;

endclass


constraint pat :: size{a.size()==10;}
constraint pat :: logic_1 { foreach(a[i])
				if(i>a.size()/2)
					a[i]==9+(i*1)*(-2);
				else
					a[i]==8+(i*1)*(-2); }
			

pat p_h;

module tb;
	
	initial begin
		p_h=new();
		repeat(10) begin
				void'(p_h.randomize());
				$display("%0p", p_h.a);
			end
	end
endmodule
*/