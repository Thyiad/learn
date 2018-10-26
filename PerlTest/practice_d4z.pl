use strict;
use warnings;
use feature 'state';

my $dis="\n\n";

# test
&greet("Fred");
&greet("Barney");
&greet("Wilma");
&greet("Betty");
my @avg = &above_average(1..10);
print "1 to 10 gt avg is: @avg.\n";

# 第二题
print "1 to 1000 sum is: ".&total(1..1000).".\n";

# 第一题
my @fred = qw{1 3 5 7 9 };
my $fred_total = &total(@fred);
print "The total of \@fred is $fred_total.\n";
print "Enter some numbers on seprarate lines: ";
my $user_total = &total(<STDIN>);
print "The total of thos numbers is $user_total.\n";
sub total{
	my $result=0;
	foreach (@_){
		$result+=$_;
	}
	$result;
}

# 第三题
sub above_average{
	my @array = ();
	my $avg = &avg(@_);
	
	foreach (@_){
		if($_ > $avg){
			push @array, $_ ;
		}
	}
	@array;
}

sub avg{
	my $sum=&total(@_);
	my $avg=$sum/@_;
}

# 第四题
sub greet{
	state @peoples;
	
	if(@_ <= 0){
		print "no people coming !";
		return;
	}
	
	my($name)=@_;
	if(@peoples == 0){
		print "Hi $name! You are the first one here !\n";
	}
	else{
		print "Hi $name! I've seen: @peoples!\n";
		#print "Hi $name! $peoples[-1] is also here !\n";
	}
	push @peoples, $name;
}










