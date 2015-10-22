use strict;
use warnings;

use Test::More tests => 2;
use Test::Script;
use Test::File::Contents;

my %options = (exit => 0);

my $script_args = ['bin/bcgTree.pl',
                   '--proteome', 'bacterium1=t/data/simple.fa',
                   '--prefix', '05_tmp'
                  ];

script_runs($script_args, \%options, "Test if script runs with existent fasta file as parameter");
files_eq('05_tmp/bacterium1.fa', 't/data/simple.renamed_headers.fa', "Output file contains the expected output (renamed headers)");