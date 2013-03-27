#!/usr/bin/perl

use strict;
use warnings;
use Email::MIME;
use LWP::UserAgent;

my $message;
while (<STDIN>) {
$message .= $_;
}

my $parsed = Email::MIME->new($message);
my @parts = $parsed->parts; # These will be Email::MIME objects, too.
my $decoded = $parsed->body;
my $non_decoded = $parsed->body_raw;
my $content_type = $parsed->content_type;


# START Pushover API
LWP::UserAgent->new()->post(
  "https://api.pushover.net/1/messages.json", [
  "token" => "YOUR PUSHOVER APP TOKEN",
  "user" => "YOUR PUSHOVER USER KEY",
  "message" => $decoded,
]);
# END Pushover API
