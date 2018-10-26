use strict;
use warnings;

# 方法1

#my @para=@ARGV;
#while(my ($ind, $value) = each @para){
#	my $tmp = $ind+1;
#	print "现在开始打印第 ${tmp} 个文件的内容：\n";
#	@ARGV = $value;
#	print <>;
#}
 
# 方法2
#my $ind=1;
#for(@ARGV){
#	print "\n\n现在开始打印第 ${ind} 个文件的内容：\n\n";
#	open FILE, '<', $_;
#	print <FILE>;
#	$ind++;
#}
