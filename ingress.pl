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
# To send notifications via Pushover:
# 1) login to your Pushover account
# 2) go to https://pushover.net/apps and create a new application
# 3) Fill out the following lines with your Pushover APP TOKEN and your Pushover USER KEY
# 4) Add this line to /etc/aliases: "h1mon:          | /opt/h1mon/ingress.pl"
#    - make sure that this path is correct
# 5) Configure your application (firewall or malware scanner) to send notifications to email "h1mon@localhost"
LWP::UserAgent->new()->post(
  "https://api.pushover.net/1/messages.json", [
  "token" => "YOUR PUSHOVER APP TOKEN",
  "user" => "YOUR PUSHOVER USER KEY",
  "message" => $decoded,
]);
# END Pushover API
