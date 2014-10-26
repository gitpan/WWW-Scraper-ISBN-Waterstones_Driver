#!/usr/bin/perl -w
use strict;

use lib './t';
use Test::More tests => 14;
use WWW::Scraper::ISBN::Waterstones_Driver;

###########################################################

my %isbn = (
    '098765432X'    => { ean13 => '9780987654328',  isbn10 => '0987654322' },
    '0987654322'    => { ean13 => '9780987654328',  isbn10 => '0987654322' },
    '0987654321'    => { ean13 => '9780987654328',  isbn10 => '0987654322' },
    '0571239560'    => { ean13 => '9780571239566',  isbn10 => '0571239560' },
    '9780571239566' => { ean13 => '9780571239566',  isbn10 => '0571239560' },
    '9780571239567' => { ean13 => '9780571239566',  isbn10 => '0571239560' },
    '978057123956'  => { ean13 => undef,            isbn10 => undef },
);

###########################################################
# Internal tests

my $driver = WWW::Scraper::ISBN::Waterstones_Driver->new();
for my $isbn (keys %isbn) {
    is($driver->convert_to_ean13($isbn), $isbn{$isbn}{ean13} ,".. isbn 13 convert for $isbn");
    is($driver->convert_to_isbn10($isbn),$isbn{$isbn}{isbn10},".. isbn 10 convert for $isbn");
}

###########################################################
