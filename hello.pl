#!/usr/bin/env perl
# $Id$ $Date$ $Revision$
use strict;
use warnings;
our $VERSION = '%%VERSION%%-%%RELEASE%%';
use English qw( -no_match_vars );
use Fatal qw(open close mkdir);
use Carp;

sub imcdate {
    ## no critic (ProhibitMagicNumbers)
    ## This would need an third party CPAN module 'Readonly'
## Forcing another change
    my $ERA       = 1900;
    my $YEARINDEX = 5;
    my ( $sec, $min, $hrs, $day, $mon, $year ) = (localtime)[ 0 .. $YEARINDEX ];
    $year += $ERA;
    $mon  += 1;
    return sprintf '%04d.%02d.%02d-%02d.%02d.%02d',
      $year, $mon, $day, $hrs, $min, $sec;
}
my $opt = $ARGV[0] || 'x';
if ( $opt =~ /-v/xism ) {
    print "hello.pl $VERSION\n" or croak "hello.pl $VERSION\n";
    exit;
}
my $logdir = $ENV{'HOME'} . '/log/';
if ( !-d $logdir ) {
    mkdir $logdir or croak $OS_ERROR;
    mkdir "$logdir/$PROGRAM_NAME" or croak $OS_ERROR;
}
$logdir .= q{/} . imcdate();
mkdir $logdir;
open my $log, '>', "$logdir/hello.log";
print {$log} imcdate() . ' : INFO : ' . "Hello World!\n" or croak 'Goodbye';
print "Hello World!\n" or croak 'Goodbye';
close $log;
