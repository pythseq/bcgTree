use strict;
use warnings;

use Test::More tests => 5;
use Test::Script;
use Test::File::Contents;
use File::Path qw(remove_tree);

my $tmpdir = "10_tmp";

my %options = (exit => 0);

my $script_args = ['bin/bcgTree.pl',
                   '--proteome', 'Acinetobacter=t/data/NC_005966.faa',
                   '--proteome', 'Escherichia=t/data/NC_008253.faa',
                   '--outdir', $tmpdir
                  ];

script_runs($script_args, \%options, "Test if script runs muscle correctly");
file_contents_like("$tmpdir/TIGR00442.aln", qr/ADQSVPAVGFAMGMERLLLLLEQVE---QAEVVRDCDVFLVAESA-FQGHALVLAEQIRD/, "Output file contains the expected alignment sequence from proteome 1");
file_contents_like("$tmpdir/TIGR00442.aln", qr/A---TPAVGFAMGLERLVLLVQAVNPEFKADPV--VDIYLVASGADTQSAAMALAERLRD/, "Output file contains the expected alignment sequence from proteome 2");
file_contents_like("$tmpdir/TIGR01031.aln-gb", qr/MAVQQNKPTRSKRGMRRSHDALTLSVDKTSGEKHLRHHITADGYYRGRKVIAK/, "Output file contains the expected alignment sequence from proteome 1");
file_contents_like("$tmpdir/TIGR01031.aln-gb", qr/MAVQQNRKSRSRRDMRRSHDALTLTVDQTTGETHRRHHVTKDGIYRGRQLFAK/, "Output file contains the expected alignment sequence from proteome 2");
remove_tree($tmpdir);