$dis="\n\n";

# ��һ��
print"��һ��$dis";
$t=3.141592654;
print "������뾶���ȣ�";
chomp($r=<STDIN>);
if($r<0){
	print "Բ�ܳ�Ϊ��".0;
}
else{
	print "Բ�ܳ�Ϊ��".$t*2*$r;
}

# �ڶ���
print"$dis�ڶ���$dis";
print"�������һ�����֣�";
chomp($p1=<STDIN>);
print"������ڶ�������";
chomp($p2=<STDIN>);
print"��˻�Ϊ��".$p1*$p2;

# ������
print"$dis������$dis";
print"������һ���ַ�����";
chomp($str=<STDIN>);
print"�������ظ�������";
chomp($count=<STDIN>);
print"�����".${str}x${count};
