#!/usr/bin/perl

open(DATA, "<d:\\ptest\\input.txt") or die "input.txt �ļ��޷���, $!";
open(DATA2, ">d:\\ptest\\output.txt") or die "output.txt �ļ��޷�д��, $!";

$canSplit = 0;
@arr=();
$rst = 0;

readline DATA;
while(<DATA>){
	my @tmp=split;
    push @arr ,\@tmp;
}

@arr = sort {@$a[0]<=>@$b[0]} @arr;
my $cnt = scalar(@arr);

sub _get_max($){
	my $idx = shift;
	my $r = 0;
	
	my ($ts,$te) = (0,0);
	for (my $i = 0; $i <$cnt; $i++){
		next if $idx == $i;
		
		if($ts == 0 && $te == 0){
			($ts,$te) = @{$arr[$i]};
			$r += $te-$ts;
			next;
		}
		
		my ($s,$e) = @{$arr[$i]};
		
		if($te<$s){
			($ts,$te) = (0,0);
			-- $i;
			next;
		}
		elsif($e<=$te){
			next;
		}else{
			$ts=$te;
			$te=$e;
			
			$r += $te-$ts;
			
			next;
		}
	}
	
	return $r;
}

my $max=0;
for (my $i = 0; $i < $cnt; $i++){
	my $r = _get_max($i);
	if($max < $r){
		$max = $r;
	}
}

print $max;

exit 0;