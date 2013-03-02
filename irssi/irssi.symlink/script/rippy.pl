use strict;
use Irssi;

use vars qw{$VERSION %IRSSI};

$VERSION = "0.5";
%IRSSI = (
          name        => 'ascii stuff',
          authors     => 'Thom Wiggers',
          contact     => 'ret@rded.nl',
          description => 'prints ascii stuff',
         );

$RIPPY

sub np {
    my($data,$server,$witem) = @_;

    if ($witem && ($witem->{type} eq "CHANNEL" ||
                   $witem->{type} eq "QUERY")) {
            $witem->command("MSG ".$witem->{name}." $str");
        }
    } else {
        Irssi::print("You're not in a channel.");
    }
}


sub help {
   print '
 MPD Now-Playing Script
========================

by Erik Scharwaechter (diozaka@gmx.de)

VARIABLES
  mpd_host      The host that runs MPD (localhost)
  mpd_port      The port MPD is bound to (6600)
  mpd_timeout   Connection timeout in seconds (5)
  mpd_format    The text to display (np: %%ARTIST - %%TITLE)
  mpd_alt_text  The Text to display, if %%ARTIST and %%TITLE are empty (np: %%FILENAME)

USAGE
  /np           Print the song you are listening to
  /np help      Print this text
';
}


Irssi::settings_add_str('mpd', 'mpd_host', 'localhost');
Irssi::settings_add_str('mpd', 'mpd_port', '6600');
Irssi::settings_add_str('mpd', 'mpd_timeout', '5');
Irssi::settings_add_str('mpd', 'mpd_format', 'np: %ARTIST - %TITLE');
Irssi::settings_add_str('mpd', 'mpd_alt_text', 'np: %FILENAME');

Irssi::command_bind np        => \&np;
Irssi::command_bind 'np help' => \&help;

