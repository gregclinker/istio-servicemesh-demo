#!/usr/bin/perl

use Time::HiRes qw(usleep);
use Parallel::ForkManager;
my $pm = Parallel::ForkManager->new(3); # number of parallel processes

my @curls=(
'curl -s http://service-a-service.ocp.com',
'curl -s http://service-b-service.ocp.com',
'curl -s http://service-c-service.ocp.com',
'curl -s http://service-a-service.ocp.com',
'curl -s http://service-b-service.ocp.com',
'curl -s http://service-c-service.ocp.com',
'curl -s http://service-a-service.ocp.com',
'curl -s http://service-b-service.ocp.com',
'curl -s http://service-c-service.ocp.com',
'curl -s http://service-a-service.ocp.com',
'curl -s http://service-b-service.ocp.com',
'curl -s http://service-c-service.ocp.com',
'kubectl exec "$SOURCE_POD" -c sleep -- curl -s http://edition.cnn.com/politics'
);

my $pm = Parallel::ForkManager->new(int(@curls));
for (@curls) {
  $pm->start and next;
	load($_,1000);
  $pm->finish;
}
$pm->wait_all_children;
print "\n";

sub load() {
	my $command=shift;
  my $scale=shift;
	my $count=0;
	for (0..10000) {
		if (++$count%100==0) {
			print "*";
		}
		xsleep($scale);
    #print "$command\n";
		`$command`;
	}
}

sub xsleep() {
  my $scale=shift;
	my $sleep=sprintf("%d", rand(50)) * $scale;
	usleep($sleep);
	#print "$sleep\n";
}
