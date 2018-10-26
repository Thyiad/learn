#!/usr/bin/perl

open(DATA, "<input.txt") or die "input.txt 文件无法打开, $!";
open(DATA2, ">output.txt") or die "output.txt 文件无法写入, $!";

$canSplit = 0;
@arr=();
$rst = 0;
while(<DATA>){
    if(!$canSplit){
        $canSplit = 1;
    }elsif($_=~m/(\d+) (\d+)/i){
        push(@arr, [($1..$2-1)]);
    }
}

@tmpArr;

for ($i = 0; $i <= $#arr; $i++) {
    @tmpArr=();
    for($j=0;$j<=$#arr;$j++){
        if($j!=$i){
            foreach $tmp(@{@arr[$j]}){
                if(!grep {$_ eq $tmp} @tmpArr){
                    push(@tmpArr, $tmp)
                }
            }
        }
    }
    if($#tmpArr>$rst){
        $rst = $#tmpArr;
    }
}

print DATA2 $rst+1;

close(DATA) || die "无法关闭文件";
close(DATA2) || die "无法关闭文件";