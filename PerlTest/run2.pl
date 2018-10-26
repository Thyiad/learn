#!/usr/bin/perl

open(DATA, "<input.txt") or die "input.txt 文件无法打开, $!";
open(DATA2, ">output.txt") or die die "output.txt 文件无法写入, $!";

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

print DATA2 $max;

close(DATA) || die "无法关闭文件";
close(DATA2) || die "无法关闭文件";