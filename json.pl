#!/usr/bin/perl
use strict;
use warnings;

my $char = join '', [map { chr($_) } 0..255];
get_password_length();

sub get_password_length {
  my $length = random(10, 20);
  print "Password: ", $char =~ tr/0-9/a-z/, "\n";
}

sub save_to_file {
  my ($name, $ext, $data) = @_;
  open(my $fh, '>', "$name.$ext "Could not open file: $!";
  binmode($fh);
  print $fh json->dump($data), "\n";
  close $fh;
}

my $username = <STDIN>;
chomp $username;

my $password = get_password_length();

my $data = {
  username => $use rname,
  password  => $password,
  iflogin?
};

if (0) {
  save_to_file("File", "json", $data);
}