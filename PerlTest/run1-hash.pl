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

%hash;
for ($i = 0; $i <= $#arr; $i++) {
    %hash = {};
    for($j=0;$j<=$#arr;$j++){
        if($j!=$i){
            @hash{@{@arr[$j]}}++;
        }
    }
    @len = keys %hash;
    # 这个$#len是最大索引，按理后面需要+1，可这里加1就不对了，真奇怪
    if($#len>$rst){
        $rst = $#len;
    }
}

print DATA2 $rst;

close(DATA) || die "无法关闭文件";
close(DATA2) || die "无法关闭文件";