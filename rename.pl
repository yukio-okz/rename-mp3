#!/usr/bin/perl
use strict;
use warnings;

my @artlist=glob("\.\/*");
foreach my $artn  (@artlist){
  print $artn ."\n";
  if (-d $artn) {
    chdir($artn);
    my @alblist=glob("\.\/*");
    foreach my $albn (@alblist){
      print $artn.$albn."\n";
      if (-d $albn) {
        chdir($albn);
        my @songlist=glob("\.\/*.mp3");
        foreach my $songn (@songlist){
          print $songn."  ";
          if ($songn=~/(\_)(\d{2})(\_)(\-)(\_)(.*)(\.mp3$)/) {#正規表現でトラックNo以降にマッチ

#(_)(数字2文字)(_)(-)(_)(任意の文字０文字以上)(.mp3)でマッチする部分を拾う
            my $songnn=($2).($3).($6).($7); #マッチした部分から、トラックNo、アンダースコア、曲名、MP3の拡張子を拾い出しつなげる。
            print "-->".$songnn."\n";
            rename $songn,$songnn ; #名前変更。
          }else{
          print "\n";
          }
        }
        chdir("..\\");
      }
    }
    chdir("..\\");
  }
}
