$dis="\n\n";

# ��һ��
print"��һ�ⷴ��\n";
print "������ֵ, ��trl+Z����\n";
chomp(@input_lines = <STDIN>);
@input_lines = reverse @input_lines;
if($#input_lines == -1){
	print"û�������κ�ֵ";
}else{
	print"����֮���ֵΪ��\n";
	while(($index, $value) = each (@input_lines)){
		print"����$index��$value\t";
	}
	#my $index=0;
	#foreach (@input_lines){
	#	print"����$index��$_\t";
	#	$index++;
	#}
}

print $dis;
# �ڶ���
print"�ڶ���ȡֵ\n";
@names=qw(jim fred betty marry dino);
print "����������ֵ��\n";
chomp(@input_lines=<STDIN>);
print "���ֱַ��ǣ�\n";
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
#������
print"����������\n";
print"����һЩ�ַ�����\n";
chomp(@input_lines=<STDIN>);
@input_lines= sort @input_lines;
print"ֵ��ͬһ�������@input_lines\n";
#print"ֵ��".@input_lines; # ��ʱΪ����
print"ֵ�ڶ��������\n";
foreach(@input_lines){
	print"$_\n";
}










