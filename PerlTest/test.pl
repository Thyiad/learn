#�Զ�����sql���

use strict;
use warnings;
use Win32::Clipboard;

my $clip = Win32::Clipboard->new();
my $in = $clip->Get();
print "--------------------- ճ�����е����� -----------------------------\n";
print "${in}\n";
print "----------------------- ��ӡ��ϣ�--------------------------------\n\n";
die "ճ�������޸��»�����Sql���" unless($in=~m/^UPDATE|INSERT/);
my @data = split "\n", $in;
my $out = "";
my $sql = "string sql = \"";
my $dbParamList="List<DbParameter> dbParamList = new List<DbParameter>();\n";
my @paramList=qw();
foreach my $line (@data){
	next if($line=~m/^\bGO\b/i or $line=~/^--/);
	next if($line=~m/^\bGO\b/i);
	$line=~s/^\s+//g;
	$line=~s/\s+$//g;
	$line=~s/<([^,]+),[^>]+>/\@$1/g;
	push @paramList, $1 if($1);
	$sql.=" " unless($sql=~m/^string sql = \"$/);
	$sql.=$line;
}
$sql.="\";\n\n";
for(@paramList){
	$dbParamList.="dbParamList.Add(new SqlParameter(\"\@${_}\",$_));";
	$dbParamList.="\n";
}
$out.=$sql.$dbParamList;
$clip->Set($out);
print "-------------------- ת��������� ----------------------------------\n";
print $out."\n";
print "--------------------- ��ӡ��ϣ�------------------------------------";