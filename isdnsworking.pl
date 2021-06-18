#!/usr/bin/env perl -w
use 5.010;
use warnings;
use Term::ANSIColor;

#here is argv
my $num_args = $#ARGV + 1;
if ($num_args != 1) {
        say color("red"), "\n Usage: isdnsworking.pl domain.tld", color("reset");
        say color("red"), "\n This script checks A records with dig across all 🇬🇷   [Greek] ISP's", color("reset");
        exit;
}

my $domain = $ARGV[0];

chomp($domain);
print "Checking $domain across all 🇬🇷   [Greek] ISP's\n";

# foreign
my $cfprimary = `dig +short $domain \@1.1.1.1`;
my $googleprimary = `dig +short $domain \@8.8.8.8`;
print "Cloudflare DNS reports: $cfprimary";
print "Google DNS reports: $googleprimary\n";
#otenet
my $otenetprimary = `dig +short $domain \@195.170.0.1`;
my $otenetsecondary = `dig +short $domain \@212.205.212.205`;
my $otenetmobile1 = `dig +short $domain \@94.143.182.1`;
my $otenetmobile2 = `dig +short $domain \@94.143.182.2`;
print "Otenet Primary DNS reports: $otenetprimary";
print "Otenet Secondary DNS reports: $otenetsecondary";
print "Otenet Mobile Primary DNS reports: $otenetmobile1";
print "Otenet Mobile Secondary DNS reports: $otenetmobile2\n";
#wind
my $windprimary = `dig +short $domain \@62.169.194.47`;
my $windsecondary = `dig +short $domain \@62.169.194.48`;
my $tertiarywindmobile1 = `dig +short $domain \@62.169.194.49`;
print "Wind Primary DNS reports: $windprimary";
print "Wind Secondary DNS reports: $windsecondary";
print "Wind Tertiary DNS reports: $tertiarywindmobile1\n";
#forthnet
my $forthnetprimary = `dig +short $domain \@193.92.150.1`;
my $forthsecondary = `dig +short $domain \@193.92.3.10`;
print "Forthnet Primary DNS reports: $forthnetprimary";
print "Forthnet Secondary DNS reports: $forthsecondary\n";
#vodafone
my $vodafoneprimary = `dig +short $domain \@213.249.17.10`;
my $vodafonesecondary = `dig +short $domain \@213.249.17.11`;
my $tertiaryvodafone = `dig +short $domain \@213.249.39.29`;
print "Vodafone Primary DNS reports: $vodafoneprimary";
print "Vodafone Secondary DNS reports: $vodafonesecondary";
print "Vodafone Tertiary DNS reports: $tertiaryvodafone";
