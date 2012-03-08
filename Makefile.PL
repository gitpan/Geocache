
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Geocaching modules",
  "AUTHOR" => "Chris Moewes-Bystrom <chris.moewes\@gmail.com>",
  "BUILD_REQUIRES" => {
    "File::Find::Rule::Perl" => 0,
    "File::Spec" => 0,
    "PPI" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Geocache",
  "EXE_FILES" => [
    "bin/brute_force.pl",
    "bin/grab.pl",
    "bin/test.pl"
  ],
  "LICENSE" => "perl",
  "NAME" => "Geocache",
  "PREREQ_PM" => {
    "DBI" => 0,
    "DBIx::Class" => 0,
    "DBIx::Class::Schema" => 0,
    "Data::Dumper" => 0,
    "IO::File" => 0,
    "LWP::Simple" => 0,
    "Lingua::EN::Nums2Words" => 0,
    "Moose" => 0,
    "MooseX::AbstractFactory" => 0,
    "Params::Validate" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.120680",
  "test" => {
    "TESTS" => ""
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



