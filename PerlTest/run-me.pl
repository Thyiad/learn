#!/usr/bin/perl

open(DATA, "<input.txt") or die "input.txt open fail, $!";
open(DATA2, ">output.txt") or die "output.txt open fail, $!";

$len=0;
@arrLeft= ();
@arrRight=();

while(<DATA>){
    if($_=~m/^(\d+) (\d+)$/){
        push(@arrLeft, $1);
        push(@arrRight, $2);
    }else{
        $len=$_;
        $len =~ s/^\s+|\s+$//g
    }
}

$max = 0;
@left;
@right;
$maxTmp=0;
for($i=0;$i<$len;$i++){
    @left=@arrLeft;
    @right=@arrRight;
    splice(@left, $i, 1);
    splice(@right, $i, 1);
    @left = sort {$a<=>$b} @left;
    @right = sort {$a<=>$b} @right;
    $maxTmp = @right[$len-2] - @left[0];
    if(@left[$len-2]>@right[0]){
        $maxTmp = $maxTmp - (@left[$len-2]-@right[0]);
    }
    if($maxTmp>$max){
        $max = $maxTmp;
    }
}

print DATA2 $max;

close(DATA);
close(DATA2);