use warnings;
use 5.010;

my $what = shift @ARGV;
my $result = $what=~/what/g;

say "$result";

say"$what";

say "dfdfd";


print "Hello, \nabc";
print STDERR "Hi\n";

#use warnings;
print "1��2��"."one"." two\n";		# .��ƴ���ַ���
print 5+3;							# +���������
print "\n����3���հ���"."\n" x 3;	# x���ظ�����
print 3.1."����\n";					# �����Զ�, ��ʽת��Ϊ�ַ���
print 3x3*'3'."\n";					# ���ظ��ַ�����ת��Ϊ���������תΪ�ַ���ƴ��
print "d31ddd\n"*3;					# �ַ����Զ�תΪ����, �����ܳ���ת��, ���ƥ�䲻����תΪ0
print 3**3;
#print chr(0x01A0);
print ord('? ');

print "���������ַ���";
chomp($input = <STDIN>);
print $input."β��";
chomp($input);
print "\n".$input."β��\ndf";
$input2 = "\n".$input."β��\ndf\n\n";
print "chompǰ (��������)��${input2}abc";
chomp $input2;
print "chompǰ (һ������)��${input2}abc";
