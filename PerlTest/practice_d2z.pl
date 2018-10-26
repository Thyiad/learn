$dis="\n\n";

# 第一题
print"第一题$dis";
$t=3.141592654;
print "请输入半径长度：";
chomp($r=<STDIN>);
if($r<0){
	print "圆周长为：".0;
}
else{
	print "圆周长为：".$t*2*$r;
}

# 第二题
print"$dis第二题$dis";
print"请输入第一个数字：";
chomp($p1=<STDIN>);
print"请输入第二个数字";
chomp($p2=<STDIN>);
print"相乘积为：".$p1*$p2;

# 第三题
print"$dis第三题$dis";
print"请输入一个字符串：";
chomp($str=<STDIN>);
print"请输入重复次数：";
chomp($count=<STDIN>);
print"结果：".${str}x${count};
