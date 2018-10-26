$dis="\n\n";

# 第一题
print"第一题反序\n";
print "请输入值, 以trl+Z结束\n";
chomp(@input_lines = <STDIN>);
@input_lines = reverse @input_lines;
if($#input_lines == -1){
	print"没有输入任何值";
}else{
	print"反序之后的值为：\n";
	while(($index, $value) = each (@input_lines)){
		print"索引$index：$value\t";
	}
	#my $index=0;
	#foreach (@input_lines){
	#	print"索引$index：$_\t";
	#	$index++;
	#}
}

print $dis;
# 第二题
print"第二题取值\n";
@names=qw(jim fred betty marry dino);
print "请输入数字值：\n";
chomp(@input_lines=<STDIN>);
print "名字分别是：\n";
foreach (@input_lines){
	if($_ == 1){
		print"fred\n";
	}
	elsif($_ == 2){
		print "bettry\n";
	}
	elsif($_ == 4){
		print "dino\n";
	}
}

print $dis;
#第三题
print"第三题排序\n";
print"输入一些字符串：\n";
chomp(@input_lines=<STDIN>);
@input_lines= sort @input_lines;
print"值在同一行输出：@input_lines\n";
#print"值：".@input_lines; # 此时为长度
print"值在多行输出：\n";
foreach(@input_lines){
	print"$_\n";
}










