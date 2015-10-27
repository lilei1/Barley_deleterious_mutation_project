#!/usr/bin/perl
use strict;
use warnings;
my ($file1, $file2) =@ARGV;

open(IN, '<', $file1) or die "Could not open  $file1!";
my %hash;
while(<IN>) {
	chomp;
	my($snp_id, $sample_id, $geno) = split("\t", $_);
	$hash{$snp_id} = $geno;
}

close IN;

open(FILE, '<', $file2) or die "Could not open  $file2!";
open(OUT, '>', "9K_SNPs_WBDC002.vcf");
#print OUT "Chrom\tStar\tEnd\tSNP_ID\n";
my $line1=<FILE>;
my $line2=<FILE>;
my $line3=<FILE>;
print OUT "$line1";
print OUT "$line2";
print OUT "$line3";
while(<FILE>) {
	#next if /^\#/;
	chomp;
	my @temp = split("\t", $_);
	if(exists $hash{$temp[2]}){
       #print OUT "$temp[0]\t$temp[1]\t$temp[1]\t$temp[2]\n";
       print OUT "$_\n";
	}
}

close FILE;
