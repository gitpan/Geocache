package Geocache;
{
  $Geocache::VERSION = '1.120680'; # TRIAL
}
use MooseX::AbstractFactory;
implementation_class_via sub { join '::', __PACKAGE__, shift };

1;