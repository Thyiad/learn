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
print "1加2："."one"." two\n";		# .号拼接字符串
print 5+3;							# +号数字相加
print "\n接着3个空白行"."\n" x 3;	# x号重复次数
print 3.1."换行\n";					# 数字自动, 隐式转换为字符串
print 3x3*'3'."\n";					# 先重复字符串再转换为数字相乘再转为字符串拼接
print "d31ddd\n"*3;					# 字符串自动转为数字, 尽可能尝试转换, 如果匹配不了则转为0
print 3**3;
#print chr(0x01A0);
print ord('? ');

print "接收输入字符：";
chomp($input = <STDIN>);
print $input."尾巴";
chomp($input);
print "\n".$input."尾巴\ndf";
$input2 = "\n".$input."尾巴\ndf\n\n";
print "chomp前 (两个换行)：${input2}abc";
chomp $input2;
print "chomp前 (一个换行)：${input2}abc";
