#!/usr/bin/perl
use strict;
use warnings;
my ($file1, $file2) =@ARGV;

open(IN, '<', $file1) or die "Could not open  $file1!";
my %hash;
while(<IN>) {
	chomp;
	my($snp_id, $sample_id, $geno) = split("\t", $_);
	$hash{$snp_id} = 9999;
}

close IN;

open(FILE, '<', $file2) or die "Could not open  $file2!";
open(OUT, '>', "alchemy_genotypes_BOPA2_geno_0.9pCall.bed");
print OUT "Chrom\tStar\tEnd\tSNP_ID\n";
while(<FILE>) {
	next if /^\#/;
	chomp;
	my @temp = split("\t", $_);
	if(exists $hash{$temp[2]}){
       print OUT "$temp[0]\t$temp[1]\t$temp[1]\t$temp[2]\n";

	}
}

close FILE;
